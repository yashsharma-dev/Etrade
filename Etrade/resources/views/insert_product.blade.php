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

                <form action="{{ route("do_insert") }}" method="post" enctype="multipart/form-data">

                    @csrf

                    <input type="text" name="pr_name" placeholder="PR_NAME" class="form-control" /> <bR><br>

                    <input type="text" name="pr_alias" placeholder="PR_ALIAS" class="form-control" /> <bR><br>

                    <input type="text" name="pr_price" placeholder="PR_PRICE" class="form-control" /> <bR><br>

                    <input type="text" name="pr_sale_price" placeholder="PR_SALE_PRICE" class="form-control" /> <bR><br>

                    <input type="text" name="pr_desc" placeholder="PR_DESC" class="form-control" />

                    <Br><bR>

                    <input type="file" name="pr_image" class="form-control" /> <bR><br>

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