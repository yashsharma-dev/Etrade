@extends('mylayout')

@section('content')



<main class="main-wrapper">

<!-- Start Cart Area  -->
<div class="axil-product-cart-area axil-section-gap">
    <div class="container">
        <div class="axil-product-cart-wrap">
            <div class="product-table-heading">
                <h4 class="title">Your Cart</h4>
                <a href="#" class="cart-clear">Clear Shoping Cart</a>
            </div>
            <div class="table-responsive">
                <table class="table axil-product-table axil-cart-table mb--40">
                    <thead>
                        <tr>
                            <th scope="col" class="product-remove"></th>
                            <th scope="col" class="product-thumbnail">Product</th>
                            <th scope="col" class="product-title"></th>
                            <th scope="col" class="product-quantity">Shipper Name</th>
                            <th scope="col" class="product-subtotal">Subtotal</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach($order_details as $order): ?>
                        <tr>
                            <td class="product-remove"><a href="#" class="remove-wishlist"><i class="fal fa-times"></i></a></td>
                            <td class="product-thumbnail"><a href="single-product.html"><img src="<?php echo e(asset('storage/kartik_images/' . $order->pr_image)); ?>" alt="Digital Product"></a></td>
                            <td class="product-title"><a href="single-product.html"><?php echo e($order->pr_name); ?></a></td>
                            <td class="product-price" data-title="Price"><span class="currency-symbol">$</span><?php echo e($order->shipper_name); ?></td>
                            <td class="product-price" data-title="Price"><span class="currency-symbol">$</span><?php echo e($order->pr_sale_price); ?></td>
                        </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>

            <div class="cart-update-btn-area">
                <div class="input-group product-cupon">
                    <input placeholder="Enter coupon code" type="text">
                    <div class="product-cupon-btn">
                        <button type="submit" class="axil-btn btn-outline">Apply</button>
                    </div>
                </div>
                <div class="update-btn">
                    <a href="" class="axil-btn btn-outline">Update Cart</a>
                </div>
            </div>

            <div class="row">
                <div class="col-xl-5 col-lg-7 offset-xl-7 offset-lg-5">
                    <div class="axil-order-summery mt--80">
                        <h5 class="title mb--20">Order Summary</h5>
                        <div class="summery-table-wrap">
                            <table class="table summery-table mb--30">
                                <tbody>
                                <tr class="order-subtotal">
    <td>Subtotal</td>
    <td>$<?php echo e($order_summary->amount - $order_summary->shipper_charge); ?></td>
</tr>
<tr class="order-shipping">
    <td>Shipping</td>
    <td>
        <div class="input-group">
            <input type="radio" id="radio1" name="shipping" checked>
            <label for="radio1"><?php echo e($order_summary->shipper_charge); ?></label>
        </div>
    </td>
</tr>
<tr class="order-tax">
    <td>Total</td>
    <td>$<?php echo e($order_summary->amount); ?></td>
</tr>
<tr class="order-tax">
    <td>State Tax  ----  18% GST</td>
    <td>$<?php echo e($order_summary->amount * 0.18); ?></td>
</tr>
<tr class="order-total">
    <td>Grand Total</td>
    <td class="order-total-amount">$<?php echo e($order_summary->amount * 1.18); ?></td>
</tr>

                                </tbody>
                            </table>
                        </div>
                        <a href="checkout.html" class="axil-btn btn-bg-primary checkout-btn">Process to Checkout</a>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<!-- End Cart Area  -->

</main>



@endsection
