<html>

<head>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

</head>

<body>

    <br>

    <div class="container">

        <div class="panel panel-primary">

            <div class="panel-heading">
                <h1>Insert New Product</h1>
            </div>

            <div class="panel-body">

                <form action="{{route('do_edit',['id'=>$row->id])}}" method="post" enctype="multipart/form-data">

                    @csrf

                    <input type="text" name="pr_name" placeholder="PR_NAME" value="{{$row->pr_name}}" class="form-control" /> <bR><br>

                    <input type="text" name="pr_alias" placeholder="PR_ALIAS" value="{{$row->pr_alias}}" class="form-control" /> <bR><br>

                    <input type="text" name="pr_price" placeholder="PR_PRICE" value="{{$row->pr_price}}" class="form-control" /> <bR><br>

                    <input type="text" name="pr_sale_price" placeholder="PR_SALE_PRICE" value="{{$row->pr_sale_price}}" class="form-control" /> <bR><br>

                    <input type="text" name="pr_desc" placeholder="PR_DESC" value="{{$row->pr_desc}}" class="form-control" />

                    <Br><bR>

                    <input type="file" name="pr_image" value="{{$row->pr_image}}" class="form-control" /> <bR><br>

                    <select name="cat_id" class="form-control">

                        <?php foreach ($result as $row) {  ?>


                        <option value="{{ $row->id }}">{{ $row->cat_name }}</option>
                        <?php   }  ?>

                    </select> <Br><br>


                    <input type="submit" value="Add New Product" class="btn btn-primary" />

                </form>

            </div>

            <div class="panel-footer">

            </div>

        </div>


    </div>

</body>

</html>