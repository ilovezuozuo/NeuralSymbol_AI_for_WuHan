#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/workspace/src/Official_package/ATI/rpi_ati_net_ft"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/workspace/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/workspace/install/lib/python3/dist-packages:/workspace/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/workspace/build" \
    "/root/miniconda3/envs/ros-python/bin/python3" \
    "/workspace/src/Official_package/ATI/rpi_ati_net_ft/setup.py" \
     \
    build --build-base "/workspace/build/Official_package/ATI/rpi_ati_net_ft" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/workspace/install" --install-scripts="/workspace/install/bin"
