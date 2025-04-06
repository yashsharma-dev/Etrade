
<html>

<head>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

</head>

<body>

    <br>

    <div class="container">

       <div class="panel panel-primary" >

            <div class="panel-heading" >
                 <h1>Create New Account</h1>   
            </div>

            

            <div class="panel-body" >

                <form action="{{ route("do_signup") }}" method="post" >

                    @csrf
                
                <input type="text" name="email" placeholder="Email"  class="form-control" /> <bR><br>

                    <input type="password" name="password" placeholder="Password"  class="form-control" /> <bR><br>

                        <input type="text" name="name" placeholder="Name" class="form-control" /> <bR><br>

                            
                                       
                                            <input type="submit" value="Create New Account" class="btn btn-primary" />

                </form>

            </div>

            <div class="panel-footer" >

            </div>

       </div>


    </div>

</body>

</html>