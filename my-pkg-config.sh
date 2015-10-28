
# PKG_CONFIG_PATH は pkg-config の検索パスを追加
# PKG_CONFIG_LIBDIR は pkg-config のデフォルト検索パスを設定
# PKG_CONFIG_LIBDIR を設定することで、クロスコンパイルに不要な.pcファイルがヒットすることを避ける

PKG_CONFIG_PATH= PKG_CONFIG_LIBDIR=${PWD}/build/lib/pkgconfig pkg-config --list-all

