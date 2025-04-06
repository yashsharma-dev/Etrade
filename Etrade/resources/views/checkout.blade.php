@extends("mylayout")


@section("content")

<main class="main-wrapper">

    <!-- Start Checkout Area  -->
    <div class="axil-checkout-area axil-section-gap">
        <div class="container">
            
                <div class="row">
                    <div class="col-lg-12">
                        

                    <form action="{{ route("place_order") }}" method="post" >
                        @csrf
                        <div class="axil-checkout-billing">
                            <h4 class="title mb--40">Billing details</h4>
                            <div class="row">
                                
                                    <div class="form-group">
                                        <label>Street Address <span>*</span></label>
                                        <input name="address" type="text" id="address1" class="mb--15" placeholder="House number and street name">
                                    </div>
                                    
                                </div>
                            </div>
                           
                        </div>
                    
                        <div class="axil-order-summery order-checkout-summery">
                            <h5 class="title mb--20">Your Order</h5>
                            <div class="summery-table-wrap">
                                <table class="table summery-table">
                                    <thead>
                                        <tr>
                                            <th>Product</th>
                                            <th>Subtotal</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <?php $sum=0; foreach ($cart_items as $item) { $sum = $sum + $item->pr_sale_price ?>
                                        

                                        <tr class="order-product">
                                            <td>{{ $item->pr_name }} <span class="quantity"></span></td>
                                            <td>${{ $item->pr_sale_price }}</td>
                                        </tr>

                                       
                                   <?php  } ?>
                                        
                                        <tr class="order-shipping">
                                            <td colspan="2">

                                                <div class="shipping-amount">
                                                    <span class="title">Shipping Method</span>
                                                    <span id="amount" class="amount">$35.00</span>
                                                </div>

                                               
                                                <div class="input-group">

                                                    <select id="shp" onchange="abc()" name="shipping_charge" >


                                                <?php foreach ($shippers as $shipper) { ?>
                                                    
                                                    <option value="{{ $shipper->shipping_charge }}-{{ $shipper->shipperID }}">{{ $shipper->shipperName }} ----- {{ $shipper->shipping_charge }}</option>
                                                
                                                    
                                                <?php } ?>

                                                
                                            </select>


                                            </div>


                                            


                                            </td>
                                        </tr>
                                        <tr class="order-total">
                                            <td>Total</td>
                                            <td id='total_amount' class="order-total-amount"></td>
                                            <input id='total_amount1' type="text" name='total_amount' type="hidden" value="" />
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <button type="submit"  class="axil-btn btn-bg-primary checkout-btn">Place Order</button>
                  

                        </div>

                    </div>

            </form>

                <p style="font-size: 20px;color:limegreen;text-align: center">Your Order ID: <span style="font-weight: bolder"><a href="{{route("myaccount")}}">{{$order_id}}</a></span></p>

                            <script>

                                var amount = parseInt(document.getElementById("shp").value.split("-")[0]);

                                document.getElementById("amount").innerHTML = "$"+amount;

                                document.getElementById("total_amount").innerHTML= "$" + ( parseInt( {{$sum}} ) + amount );

                                document.getElementById("total_amount1").value= ( parseInt( {{$sum}} ) + amount );

                                function abc()
                                {


                                    var amount = parseInt(document.getElementById("shp").value.split("-")[0]);

                                    document.getElementById("amount").innerHTML = "$"+amount;

                                    document.getElementById("total_amount").innerHTML= "$" + ( parseInt( {{$sum}} ) + amount );

                                    document.getElementById("total_amount1").value = ( parseInt( {{$sum}} ) + amount );


                                }

                            </script>

                            
                            </div>
                         </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- End Checkout Area  -->

</main>



@endsection