require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test 'render a list of products' do
    get products_path

    assert_response :success
    assert_select '.product', 3
    assert_select '.category', 2
  end

  test 'render a list of products filtered by category' do
    get products_path(category_id: categories(:videogames).id)

    assert_response :success
    assert_select '.product', 2
  end
 
  test 'render a detailed product page' do
    get product_path(products(:iphone))

    assert_response :success
    assert_select '.title', 'Iphone'
    assert_select '.description', 'esta en exelencte estado'
    assert_select '.price', '$500'
  end

  test 'render a new product form' do
    get new_product_path

    assert_response :success
    assert_select 'form'
  end

  test 'allow to create a new product' do
    post products_path, params: {
      product: {
        title: "Iphone",
        description: "esta en exelencte estado",
        price: 500,
        category_id: categories(:videogames).id
      }
    }

    assert_redirected_to products_path
    assert_equal flash[:notice], 'El producto fue creado con éxito'
  end

  test 'does not allow to create a new product with empty fields' do
    post products_path, params: {
      product: {
        title: "",
        description: "esta en exelencte estado",
        price: 500
      }
    }

    assert_response :unprocessable_entity
  end

  test 'render an edit product form' do
    get new_product_path(products(:iphone))

    assert_response :success
    assert_select 'form'
  end

  test 'allows to update a product' do
    patch product_path(products(:iphone)), params: {
      product: {
        price: 400
      }
    }

    assert_redirected_to products_path
    assert_equal flash[:notice], 'El producto se actualizó con éxito'
  end

  test 'does allows to update a product with an invalid field' do
    patch product_path(products(:iphone)), params: {
      product: {
        price: nil
      }
    }

    assert_response :unprocessable_entity
  end

  test 'can delete products' do
    assert_difference('Product.count', -1) do
      delete product_path(products(:iphone))
    end
    assert_redirected_to products_path
    assert_equal flash[:notice],'El producto se eliminó con éxito'
  end
end
