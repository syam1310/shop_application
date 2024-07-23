package com.shop.shop_app.controller;

import com.shop.shop_app.constants.ShopConstants;
import com.shop.shop_app.entity.Product;
import com.shop.shop_app.entity.Response;
import com.shop.shop_app.service.IShopService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Tag(
        name = "CRUD REST APIs for Shop Application",
        description = "CRUD REST APIs in Shop application to CREATE, FETCH product details"
)


@RestController
@RequestMapping("/product")
public class ProductController {

    private final IShopService service;

    @Autowired
    ProductController(IShopService service) {
        this.service = service;
    }

    @Operation(
            summary = "Fetch Product Rest Api",
            description = "Rest Api to fetch product from the shop application"
    )
    @ApiResponses({
            @ApiResponse(
                    responseCode = "201",
                    description = "HTTP STATUS CREATED"
            ),

            @ApiResponse(
                    responseCode = "500",
                    description = "HTTP STATUS INTERNAL SERVER ERROR"
            )
    }
    )
    @GetMapping("/all")
    public ResponseEntity<List<Product>> getAllProduct() {
        List<Product> productList = service.fetchAllProduct();
        if (!productList.isEmpty()) {
            return ResponseEntity.status(HttpStatus.OK).body(productList);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }
    }

    @Operation(
            summary = "Fetch Product Rest Api",
            description = "Rest Api to fetch by id product from shop application"
    )
    @ApiResponses({
            @ApiResponse(
                    responseCode = "201",
                    description = "HTTP STATUS CREATED"
            ),

            @ApiResponse(
                    responseCode = "500",
                    description = "HTTP STATUS INTERNAL SERVER ERROR"
            )
    }
    )

    @GetMapping("/id/{id}")
    public ResponseEntity<Product> getProduct(@PathVariable("id") int id) {
        Product product = service.fetchProductById(id);
        if (product != null)
            return ResponseEntity.status(HttpStatus.OK).body(product);
        else
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(product);
    }

    @Operation(
            summary = "Create Product Rest Api",
            description = "Rest Api to create new product from shop application"
    )
    @ApiResponses({
            @ApiResponse(
                    responseCode = "201",
                    description = "HTTP STATUS CREATED"
            ),

            @ApiResponse(
                    responseCode = "500",
                    description = "HTTP STATUS INTERNAL SERVER ERROR"
            )
    }
    )
    @PostMapping("/create")
    public ResponseEntity<Response> save(@RequestBody Product product) {
        boolean isSaved = service.saveProduct(product);
        if (isSaved) {
            return ResponseEntity.status(HttpStatus.CREATED).body(
                    new Response(ShopConstants.STATUS_201, ShopConstants.MESSAGE_201)
            );
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(
                    new Response(ShopConstants.STATUS_500, ShopConstants.MESSAGE_500)
            );
        }
    }

    @Operation(
            summary = "Fetch Product Rest Api",
            description = "Rest Api to fetch by type product from shop application"
    )
    @ApiResponses({
            @ApiResponse(
                    responseCode = "201",
                    description = "HTTP STATUS CREATED"
            ),

            @ApiResponse(
                    responseCode = "500",
                    description = "HTTP STATUS INTERNAL SERVER ERROR"
            )
    }
    )
    @GetMapping("/type/{type}")
    public ResponseEntity<List<Product>> getProductByType(@PathVariable("type") String type) {
        List<Product> products = service.fetchProductByType(type);
        if (products != null && !products.isEmpty()) {
            return ResponseEntity.status(HttpStatus.OK).body(products);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(products);
        }
    }

    @GetMapping("/types")
    public List<String> getDistinctTypes(){
        return service.fetchDistinctTypes();
    }

}
