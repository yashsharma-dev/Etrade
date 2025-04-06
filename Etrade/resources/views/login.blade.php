@extends("login_layout")

@section("content")

<div class="axil-signin-area">

    <!-- Start Header -->
    <div class="signin-header">
        <div class="row align-items-center">
            <div class="col-sm-4">
                <a href="{{route('whome')}}" class="site-logo"><img src="assets/images/logo/logo.png" alt="logo"></a>
            </div>
            <div class="col-sm-8">
                <div class="singin-header-btn">
                    <p>Not a member?</p>
                    <a href="sign-up.html" class="axil-btn btn-bg-secondary sign-up-btn">Sign Up Now</a>
                </div>
            </div>
        </div>
    </div>
    <!-- End Header -->

    <div class="row">
        <div class="col-xl-4 col-lg-6">
            <div class="axil-signin-banner bg_image bg_image--9">
                <h3 class="title">We Offer the Best Products</h3>
            </div>
        </div>
        <div class="col-lg-6 offset-xl-2">
            <div class="axil-signin-form-wrap">
                <div class="axil-signin-form">
                    <h3 class="title">Sign in to eTrade.</h3>
                    <p class="b2 mb--55">Enter your detail below</p>
                    <span class="alert alert-danger" style="padding: 0px">{{ $msg }}</span><Br><Br>
                    <form action="{{ route("w_do_login") }}" method="post" class="singin-form">
                        @csrf
                        <div class="form-group">
                            <label>Email</label>
                            <input type="email" class="form-control" name="email" value="ashborn@gmail.com">
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" class="form-control" name="password" value="12345">
                        </div>
                        <div class="form-group d-flex align-items-center justify-content-between">
                            
                            <button type="submit" class="axil-btn btn-bg-primary submit-btn">Sign In</button>
                            
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


@endsection