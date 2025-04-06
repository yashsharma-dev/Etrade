<!-- Start New Arrivals Product Area  -->
<div class="axil-new-arrivals-product-area fullwidth-container bg-color-white axil-section-gap pb--0">
    <div class="container ml--xxl-0">
        <div class="product-area pb--50">
            <div class="section-title-wrapper">
                <span class="title-highlighter highlighter-primary"><i class="far fa-shopping-basket"></i> This Week’s</span>
                <h2 class="title">{{ $cat_name }}</h2>
            </div>
            <div class="new-arrivals-product-activation slick-layout-wrapper--15 axil-slick-arrow  arrow-top-slide">
                
                <?php foreach ($result as  $row) { ?>
                
                
                
                <div class="slick-single-layout">
                    <div class="axil-product product-style-four">
                        <div class="thumbnail">
                            <a href="single-product.html">
                                <img data-sal="fade" style="height: 250px;" data-sal-delay="100" data-sal-duration="1500" src="{{ asset("storage/kartik_images/".$row->pr_image) }}" alt="Product Images">
                                <img class="hover-img" style="height: 250px;" src="{{ asset("storage/kartik_images/".$row->pr_image) }}" alt="Product Images">
                            </a>
                            <div class="label-block label-right">
                                <div class="product-badget">
                                <?php
                                    // Check if pr_price is not zero to avoid division by zero
                                    if ($row->pr_price > 0) {
                                        // Calculate discount percentage and round it to 2 decimal places
                                        $discountPercentage = round(($row->pr_sale_price / $row->pr_price) * 100, 2);
                                        echo "<div class='product-badget'>{$discountPercentage}% Off</div>";
                                    } else {
                                        // Handle the case where pr_price is zero
                                        echo "<div class='product-badget'>No Discount</div>";
                                    }
                                    ?>
                                </div>
                            </div>
                            <div class="product-hover-action">
                                <ul class="cart-action">


                                    <li class="wishlist"><a href="wishlist.html"><i class="far fa-heart"></i></a></li>

                                    <?php if(request()->session()->get("login")){ ?>
                                     <li class="select-option"><a href="{{route("add_to_cart",['id'=> $row->id ])}}">Add to Cart</a></li>
                                    <?php }else{ ?>
                                        <li class="select-option"><a href="{{ route('login') }}">Add to Cart</a>
                                        </li>   
                                        <?php } ?>
                                    <li class="quickview"><a href="#" data-bs-toggle="modal" data-bs-target="#quick-view-modal"><i class="far fa-eye"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="product-content">
                            <div class="inner">
                                <h5 class="title"><a href="single-product.html">{{ $row->pr_name }}</a></h5>
                                <div class="product-price-variant">
                                    <span class="price old-price">${{ $row->pr_price }}</span>
                                    <span class="price current-price">${{ $row->pr_sale_price }}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                
            <?php } ?>
                <!-- End .slick-single-layout -->
                
            </div>
        </div>
    </div>
</div>
<!-- End New Arrivals Product Area  -->