PACKAGES = opencv liblo

PKGFLAGS = $(shell pkg-config --cflags $(PACKAGES))
PKGLIBS += $(shell pkg-config --libs $(PACKAGES))
CXXFLAGS += $(PKGFLAGS)
LDLIBS += $(PKGLIBS)

TARGETS = calibrate_camera_charuco calibrate_camera		\
	create_board_charuco create_board create_diamond	\
	create_marker detect_board_charuco detect_board		\
	detect_diamonds detect_markers detect_and_print_markers	\
	detector_params.yml detect_and_send_markers

all: build src $(patsubst %,build/%,$(TARGETS))

build:
	mkdir -p build

build/%: src/%.cc
	$(CXX) $(CXXFLAGS) $< $(LDFLAGS) $(LDLIBS) -o $@

build/%: src/%.cpp
	$(CXX) $(CXXFLAGS) $< $(LDFLAGS) $(LDLIBS) -o $@

src/%: /usr/share/doc/opencv-doc/examples/aruco/%.gz
	zcat $< > $@

src/%: /usr/share/doc/opencv-doc/examples/aruco/%
	cat $< > $@

build/%: src/%
	cp $< $@

dep:
	sudo apt-get install build-essential opencv-doc libopencv-dev

clean:
	rm -Rf build

