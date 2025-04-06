<html>

<head>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

</head>

<body>

    <br> <BR>

    <div class="container">

        <div class="row" >

            <div class="col-md-5" >

                <img src='{{ asset("storage/kartik_images/".$row->pr_image) }}' class="img-responsive" />
            </div>

            <div class="col-md-7" >

                <h1>{{ $row->pr_name }}</h1>

                <h3>{{ $row->cat_name }}</h3>

                <p>{{ $row->pr_desc }}</p>

                <p >{{ $row->pr_price }}</p>

                <p>{{ $row->pr_sale_price }}</p>


            </div>


        </div>

    </div>

</body>

</html>