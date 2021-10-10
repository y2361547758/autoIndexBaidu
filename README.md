# Nginx AutoIndex - BaiduYun theme

## Requirements

[nginx](http://nginx.org/) with the [xslt](http://nginx.org/en/docs/http/ngx_http_xslt_module.html) module.

## Usage
#### /etc/nginx/default.d/autoindex.conf
```nginx
location / {
    autoindex on;
    autoindex_format xml;

    xslt_stylesheet /path/to/root/directory/autoindex.xslt;
}
location /_plugin/ {
    alias /usr/lib64/nginx/plugin/;
}
```

#### /path/to/root/directory/
put `autoindex.xslt`, `icon.css`, icon image and other static resource in this path

## custom
Inject some string
```nginx
location / {
    # load custom style
    xslt_string_param style-custom '/__plugin/custom.css';
    # set footer link
    xslt_string_param custom-link 'rila.ren';
    # set footer Text
    xslt_string_param custom-desc 'Honoka';
}
```

## Feature
* Tap-friendly view.
* Switch view between Detailed view and Icons view. (require JavaScript)
* Remember every view of a dir, and inherit from parent dir. (require Cookies)

## Reference
[ngx_http_autoindex_module](https://nginx.org/en/docs/http/ngx_http_autoindex_module.html) 
[ngx_http_xslt_module](https://nginx.org/en/docs/http/ngx_http_xslt_module.html)
