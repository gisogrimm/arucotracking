PACKAGES = opencv

PKGFLAGS = $(shell pkg-config --cflags $(PACKAGES))
PKGLIBS += $(shell pkg-config --libs $(PACKAGES))
CXXFLAGS += $(PKGFLAGS)
LDLIBS += $(PKGLIBS)

TARGETS = calibrate_camera_charuco calibrate_camera		\
	create_board_charuco create_board create_diamond	\
	create_marker detect_board_charuco detect_board		\
	detect_diamonds detect_markers detector_params.yml

all: build src $(patsubst %,build/%,$(TARGETS))

build:
	mkdir -p build

src:
	mkdir -p src

build/%: src/%.cc
	$(CXX) $(CXXFLAGS) $< $(LDFLAGS) $(LDLIBS) -o $@

build/%: src/%.cpp
	$(CXX) $(CXXFLAGS) $< $(LDFLAGS) $(LDLIBS) -o $@

src/%: /usr/share/doc/opencv-doc/examples/aruco/%.gz
	zcat $< > $@

src/%: /usr/share/doc/opencv-doc/examples/aruco/%
	cat $< > $@

dep:
	sudo apt-get install build-essential opencv-doc libopencv-dev

clean:
	rm -Rf build src
