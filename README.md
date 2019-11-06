# Apache AutoIndex - BaiduYun theme
[Live View](http://jp.rika.ren/apk/)

## Usage
Just clone this repo on your file root (index dir)

then all dirs under this folder would have 

## Feature
* Tap-friendly view.
* Switch view between Detailed view and Icons view. (require JavaScript)
* Remember every view of a dir, and inherit from parent dir. (require Cookies)

> There's my name and link in `README.html` that will show as footer, modify it as you wish

> If you don't want any Cookies or JavaScript or neither of them, just delete the code in `HEADER.html`

### To set Detailed view as defatule:
Change `HEADER.html` [Line #131](HEADER.html#L131):
```javascript
if (p == -1) return 1;
```

## Note
Defaultly, `HEADER.html` will append in the front of the page, and `README.html` will append int the end of the page. You can write `ReadmeName FOOTER.html` in `.htaccess` if you like

If you hold multi sites on one server and you want to apply this theme to every site without copy these files everytime:
1. Place one copy in some place (for example: `/var/www/theme`)
2. Edit `/etc/httpd/conf.d/autoindex.conf` or `/etc/apache2/mods-available/autoindex.conf`(and remember `a2enmod autoindex`), change default icons dir
```apache
Alias /icons/ "/var/www/theme/"
<Directory "/var/www/theme/">
    Options Indexes MultiViews FollowSymlinks
    AllowOverride None
    Require all granted
</Directory>
```
3. Then write rules in `autoindex.conf` like `.htaccess`, make sure file path can be access from site
```apache
AddIcon /icons/icon/folder.png ..
AddIcon /icons/icon/folder.png ^^DIRECTORY^^
DefaultIcon /icons/icon/cloud.png
HeaderName /icons/HEADER.html
ReadmeName /icons/README.html
```

You can add comment on files by writing this in `.htaccess`, And you can create `.htaccess` on any sub dir. But a too long name/comment would overflow and been hidden.

```apache
AddDescription "<comment>" <path/><somefile>
```

## Reference
See Apache (httpd) doc for `mod_autoindex`: [The Office Doc](http://httpd.apache.org/docs/current/mod/mod_autoindex.html) or [Chinese Translate](https://www.php.cn/manual/view/17749.html)

## Icons
> This theme include third-party image resources from [BaiduYun](pan.baidu.com), here are some new icons

![Folder](https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/Folder_54_78c9568.png)
![Misc](https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/Misc_54_441d234.png)
![Share](https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/Share_54_142956d.png)
![Collection](https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/Collection_54_7d61f0d.png)
![card](https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/card_54_25f7f47.png)
![source](https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/source_54_4c37fd2.png)
![MyData](https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/MyData_54_500e8ec.png)
![Video](https://pan.baidu.com/box-static/file-widget-1/common/Video_54_7e51352.png)
![Music](https://pan.baidu.com/box-static/file-widget-1/common/Music_54_e4168c1.png)
![Image](https://pan.baidu.com/box-static/file-widget-1/common/Picture_24_7d34de9.png)
![ZIP](https://pan.baidu.com/box-static/file-widget-1/common/ZIP_54_e159554.png)
![RAR](https://pan.baidu.com/box-static/file-widget-1/common/RAR_54_38a4dee.png)
![EXE](https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/EXE_54_7d37e74.png)
![Code](https://pan.baidu.com/box-static/file-widget-1/common/Code_54_dc1557f.png)
![Text](https://pan.baidu.com/box-static/file-widget-1/common/Text_54_740be91.png)
![Web](https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/Web_54_8b00f4d.png)
![Link](https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/Links_54_de14a60.png)
![Word](https://pan.baidu.com/box-static/file-widget-1/common/Word_54_1697817.png)
![PDF](https://pan.baidu.com/box-static/file-widget-1/common/PDF_54_6d11964.png)
![Excel](https://pan.baidu.com/box-static/file-widget-1/common/Excel_54_87f09d6.png)
![PPT](https://pan.baidu.com/box-static/file-widget-1/common/PPT_54_7f2f21a.png)
![Visio](https://pan.baidu.com/box-static/file-widget-1/common/Visio_54_9948b72.png)
![Fonts](https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/Fonts_54_31425f7.png)
![Flash](https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/Flash_54_ac112d6.png)
![PS](https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/PS_54_53f38c4.png)
![AI](https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/AI_54_b6553d9.png)
![CAD](https://pan.baidu.com/box-static/file-widget-1/common/CAD_54_7a62eee.png)
![PC](https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/PC_54_e16989b.png)
![Phone](https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/Phone_54_7f262c3.png)
![Android](https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/Android_54_daaaf00.png)
![Apple](https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/Apple_54_3f940b5.png)
![BT](https://pan.baidu.com/box-static/file-widget-1/common/BT_54_5cad9fb.png)
![Pages](https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/Pages_54_bf96030.png)
![Numbers](https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/Numbers_54_397f8aa.png)
![MMAP](https://pan.baidu.com/box-static/file-widget-1/common/MMAP_54_2dd9ccc.png)
![Xmind](https://pan.baidu.com/box-static/file-widget-1/common/Xmind_54_fb36d59.png)
![MM](https://pan.baidu.com/box-static/file-widget-1/common/MM_54_b0af0a9.png)
![ESP](https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/EPS_54_7f8fbd3.png)
![Keynote](https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/Keynote_54_0f6905d.png)

> from [Magireco](magireco.com)

![close](icon/popup_close.png)
