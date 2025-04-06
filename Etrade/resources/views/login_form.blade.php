
<html>

<head>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

</head>

<body>

    <br>

    <div class="container">

       <div class="panel panel-primary" >

            <div class="panel-heading" >
                 <h1>Login Your Account</h1>   
            </div>

            

            <div class="panel-body" >

                <span class="alert alert-danger" style="padding: 0px">{{ $msg }}</span><Br>

                <form action="{{ route("do_login") }}" method="post" >

                    @csrf
                
                <input type="text" name="email" placeholder="Email"  class="form-control" /> <bR><br>

                    <input type="password" name="password" placeholder="Password"  class="form-control" /> <bR><br>

                        
                            
                                       
                                            <input type="submit" value="Login Your Account" class="btn btn-primary" />

                </form>

            </div>

            <div class="panel-footer" >

            </div>

       </div>


    </div>

</body>

</html>