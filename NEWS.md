# versionsort 1.1.0

* Implemented `ver_latest()`.
* Fixed a bug where an error would be thrown when passing an empty vector to `ver_sort()` and `ver_order()`. Now the behavior is consistent with base R `sort()` and `order()`, returning empty `character` and `integer` vectors respectively.

# versionsort 1.0.0

* Implemented `ver_sort()` and `ver_order()`.
* Added a `NEWS.md` file to track changes to the package.
