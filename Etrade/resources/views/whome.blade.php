@extends("mylayout",array('cart_items'=>$cart_items))


@section("content")



<!-- Start Expolre Product Area  -->
<!-- <div class="axil-product-area bg-color-white axil-section-gap pb--0">
    <div class="container">
        <div class="product-area pb--80">
            <div class="section-title-wrapper">
                <span class="title-highlighter highlighter-primary"><i class="far fa-shopping-basket"></i> Our Products</span>
                <h2 class="title">Explore our Products</h2>
            </div>
            <div class="row row--15">


                <?php foreach ($result as $row) { ?>



                    <div class="col-xl-3 col-lg-4 col-sm-6 col-12 mb--30">
                        <div class="axil-product product-style-one">
                            <div class="thumbnail">
                                <a href="{{route('single_product',['id'=>$row->id])}}">
                                    <img data-sal="fade" data-sal-delay="100" data-sal-duration="1500" style="height: 250px" src="{{ asset("storage/kartik_images/".$row->pr_image) }}" alt="Product Images">
                                </a>
                                <div class="label-block label-right">
                                    <?php
                                    // Check if pr_price is not zero to avoid division by zero
                                    if ($row->pr_price > 0) {
                                        // Calculate discount percentage and round it to 2 decimal places
                                        $discountPercentage = round(($row->pr_sale_price / $row->pr_price) * 100);
                                        echo "<div class='product-badget'>{$discountPercentage}% Off</div>";
                                    } else {
                                        // Handle the case where pr_price is zero
                                        echo "<div class='product-badget'>No Discount</div>";
                                    }
                                    ?>
                                </div>
                                <div class="product-hover-action">
                                    <ul class="cart-action">
                                        <li class="wishlist"><a href="wishlist.html"><i class="far fa-heart"></i></a></li>
                                        <li class="select-option"><a href="cart.html">Add to Cart</a></li>
                                        <li class="quickview"><a href="#" data-bs-toggle="modal" data-bs-target="#id_{{ $row->id }}"><i class="far fa-eye"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="product-content">
                                <div class="inner">
                                    <h5 class="title"><a href="{{route('single_product',['id'=>$row->id])}}">{{ $row->pr_name }}</a></h5>
                                    <div class="product-price-variant">
                                        <span class="price old-price">${{ $row->pr_price }}</span>
                                        <span class="price current-price">${{ $row->pr_sale_price }}</span>
                                    </div>
                                    <div class="color-variant-wrapper">
                                        <ul class="color-variant">
                                            <li class="color-extra-01 active"><span><span class="color"></span></span>
                                            </li>
                                            <li class="color-extra-02"><span><span class="color"></span></span>
                                            </li>
                                            <li class="color-extra-03"><span><span class="color"></span></span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                <?php   } ?>


            </div>
            <div class="row">
                <div class="col-lg-12 text-center mt--20 mt_sm--0">
                    <a href="shop.html" class="axil-btn btn-bg-lighter btn-load-more">View All Products</a>
                </div>
            </div>
        </div>
    </div>
</div> -->



<x-myslider catid="1"></x-myslider>

<x-myslider catid="2"></x-myslider>

<x-myslider catid="3"></x-myslider>

<x-myslider catid="4"></x-myslider>

<x-myslider catid="5"></x-myslider>

<x-myslider catid="6"></x-myslider>


@endsection