<html>

<head>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

    <script src="{{ asset("storage/jquery.js") }}" type="text/javascript"></script>

    <script src="{{ asset("storage/jquery-ui.min.js") }}" type="text/javascript"></script>

    <link rel="stylesheet" href="{{ asset('storage/jquery-ui.min.css') }}">

    <script>

        var myarray=[];

        <?php $count=0;
        
        foreach($result as $row) {  ?>
        
            myarray[{{$count}}]="{{ $row->pr_name }}";

    <?php $count=$count+1; } ?>
      

        $(document).ready(function() {

            $("#num1").autocomplete({source:myarray});

        });


    </script>

</head>

<body>

    <br> <br>

   

    <div class="container">

        <?php if(request()->session()->get("login")) 
        { ?>
                <p style="text-align: right;"> Hi, <?php echo request()->session()->get("name"); ?> | 
                    
                    <a href="{{ route("logout") }}" >LogOut</a>
                    <p> 
       <?php }
        else
        { ?>
        <p style="text-align: right;"> <a href="{{ route("signup") }}" >Sign Up</a> | <a href="{{ route("login") }}" >LogIn</a> <p> 

            <?php } ?>

<br>

        <form action="{{ route("search_product") }}" method="post" >

            @csrf

            <input id="num1" type="text" name="search" class="form-control" placeholder="Search....." /> <Br>

            <input type="submit" value="Search" class="btn btn-primary" />

        </form>

        <br><br>

        <a href="{{ route("insert_product") }}" >Insert New Product</a> <bR><br>

        <table class="table table-bordered">

            <tr>
                <th>Product Name</th>
                <th>Category Name</th>
                <th>Product Alias</th>
                <th>Product Desc</th>
                <th>Product Price</th>
                <th>Product Sale Price</th>
                <th>Product Image</th>
                <?php if(request()->session()->get("login")) { ?>
                <th>Edit</th>
                <th>Delete</th>
                <?php } ?>
            </tr>

            <?php foreach ($result as $row) { ?>

                <tr>
                    <td> <a href="{{ route("product_details",['id'=>$row->id]) }}" > {{ $row->pr_name }} </a> </td>
                    <td><a href='{{ route("category_details",['id'=>$row->cat_id]) }}' >{{ $row->cat_name }}</a></td>
                    <td>{{ $row->pr_alias }}</td>
                    <td>{{ $row->pr_desc }}</td>
                    <td>{{ $row->pr_price }}</td>
                    <td>{{ $row->pr_sale_price }}</td>
                    <td> <img src='{{ asset('storage/kartik_images/'.$row->pr_image) }}' class='img-responsive' /></td>
                    <?php if(request()->session()->get("login")) { ?>
                    <td><a href="{{ route('edit_product',['id'=>$row->id]) }}" >Edit</a></td>
                    <td><a href="{{ route('product_delete',['id'=>$row->id]) }}" >Delete</a></td>
                    <?php } ?>
                </tr>
                
           <?php } ?>

        </table>

    </div>

</body>

</html>