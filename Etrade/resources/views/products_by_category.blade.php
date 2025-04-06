<html>

<head>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

</head>

<body>

    <br>

    <div class="container">

        <table class="table table-bordered">

            <tr>
                <th>Product Name</th>
               
                <th>Product Alias</th>
                <th>Product Desc</th>
                <th>Product Price</th>
                <th>Product Sale Price</th>
                <th>Product Image</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>

            <?php foreach ($result as $row) { ?>

                <tr>
                    <td> <a href="{{ route("product_details",['id'=>$row->id]) }}" > {{ $row->pr_name }} </a> </td>
                    <td>{{ $row->pr_alias }}</td>
                    <td>{{ $row->pr_desc }}</td>
                    <td>{{ $row->pr_price }}</td>
                    <td>{{ $row->pr_sale_price }}</td>
                    <td> <img src='{{ asset('storage/kartik_images/'.$row->pr_image) }}' class='img-responsive' /></td>
                    <td><a href="" >Edit</a></td>
                    <td><a href="" >Delete</a></td>
                    
                </tr>
                
           <?php } ?>

        </table>

    </div>

</body>

</html>