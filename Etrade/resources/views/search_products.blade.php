<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    
    <link rel="stylesheet" href="{{asset('storage/jquery-ui.min.css')}}">
    <script src="{{asset('storage/jquery-ui.min.js')}}"></script>
    <script src="{{asset('storage/jquery.js')}}"></script>

</head>

<body>

    <div class="container">

        <br>
        <h1>Total Products : {{$count}}</h1>

    <br>
    <a href="{{route('insert_product')}}">Insert New Product</a>
        <br><br>
    <table border class="table table-bordered">
            <tr>
                <th>id</th>
                <th>Product Name</th>
                <th>Category Name</th>
                <th>Product Alias</th>
                <th>Product Desc</th>
                <th>Product Price</th>
                <th>Product Sale Price</th>
                <th>Product Image</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>

            <?php foreach($result as $row){?>

                <tr>
                    <td>{{$row->id}}</td>
                    
                    <td>
                        <a href="{{ route("product_details",['id'=>$row->id]) }}" > {{ $row->pr_name }} </a> </td>


                        <td><a href='{{ route("category_details",['id'=>$row->cat_id]) }}' >{{ $row->cat_name }}</a></td>

                    <td>{{$row->pr_alias}}</td>
                    <td>{{$row->pr_desc}}</td>
                    <td>{{$row->pr_price}}</td>
                    <td>{{$row->pr_sale_price}}</td>
                    <td><img width="200" src="{{asset('storage/kartik_images/'.$row->pr_image)}}" alt=""></td>
                    <td><a href="{{route('edit_product',['id'=>$row->id])}}">edit</a></td>
                    <td><a href="{{route('product_delete',['id'=>$row->id])}}">delete</a></td>
                </tr>
                <?php }?>
        </table>
    </div>

</body>

</html>