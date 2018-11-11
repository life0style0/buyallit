function calculateDayJjw() {
    const startDay = new Date($('#datetimepicker1 input').val());
    const endDay = new Date($('#datetimepicker2 input').val());
    if (endDay <= startDay) {
        startDay.setDate(startDay.getDate() + 1);
        $('#datetimepicker2').data("DateTimePicker").date(startDay);
    } else {
        const betweenDay = (endDay - startDay) / (1000 * 60 * 60 * 24);
        $('#betweenDay').html(`<strong>${betweenDay}박 ${betweenDay + 1}일</strong>`);
    }
}

function setDatetimepickerSetting() {
    $('#datetimepicker1').datetimepicker({
        locale: 'ko',
        format: 'YYYY-MM-DD',
        icons: {
            next: "fa fa-chevron-right",
            previous: "fa fa-chevron-left",
        },
        defaultDate: 'now'
    });

    $('#datetimepicker2').datetimepicker({
        useCurrent: false, //Important! See issue #1075
        locale: 'ko',
        format: 'YYYY-MM-DD',
        icons: {
            next: "fa fa-chevron-right",
            previous: "fa fa-chevron-left",
        },
        defaultDate: 'tomorrow'
    });
    $("#datetimepicker1").on("dp.change", function (e) {
        $('#datetimepicker2').data("DateTimePicker").minDate(e.date);
        calculateDayJjw();
    });
    $("#datetimepicker2").on("dp.change", function (e) {
        $('#datetimepicker1').data("DateTimePicker").maxDate(e.date);
        calculateDayJjw();
    });
}

function addsearchPersonNumber(className) {
    const peopleHtml = `<div class="col-md-6">
    <div class="form-group">
      <label>어른 수</label>
      <select class="form-control ${className}" name="searchAdultNumber">
        <option>1</option>
        <option selected>2</option>
        <option>3</option>
        <option>4</option>
        <option>5</option>
        <option>6</option>
        <option>7</option>
        <option>8</option>
        <option>9</option>
      </select>
    </div>
  </div>
  <div class="col-md-6">
    <div class="form-group">
      <label>아이 수</label>
      <select class="form-control ${className}" name="searchChildNumber">
        <option>0</option>
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
        <option>5</option>
        <option>6</option>
        <option>7</option>
        <option>8</option>
        <option>9</option>
      </select>
    </div>
  </div>`;
    return peopleHtml;
}

function changeRoomNumberJjw(element) {
    const beforeValue = parseInt($('#roomNumberHidden').val());
    const thisValue = parseInt(element.value);
    if (beforeValue < thisValue) {
        for (let i = beforeValue + 1; i <= thisValue; i += 1) {
            $('#roomNumberAnchor').append(addsearchPersonNumber('input-lg'));
        }
    } else if (beforeValue > thisValue) {
        for (let i = beforeValue; i > thisValue; i -= 1) {
            for (let j = 0; j < 2; j += 1) {
                $('#roomNumberAnchor').children().last().remove();
            }
        }
    }
}

function changeRoomNumber2Jjw(element) {
    const beforeValue = parseInt($('#roomNumberHidden').val());
    const thisValue = parseInt(element.value);
    if (beforeValue < thisValue) {
        for (let i = beforeValue + 1; i <= thisValue; i += 1) {
            $('#roomNumberAnchor').append(addsearchPersonNumber(''));
        }
    } else if (beforeValue > thisValue) {
        for (let i = beforeValue; i > thisValue; i -= 1) {
            for (let j = 0; j < 2; j += 1) {
                $('#roomNumberAnchor').children().last().remove();
            }
        }
    }
}

// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places();
// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = $('#searchValueInput').val();

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch(keyword, placesSearchCB);
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === daum.maps.services.Status.OK) {
        const address = data[0].address_name.split(' ');
        if (address[0] === '서울') {
            $('#searchValueInputHidden').val(address[1]);
        } else {
            // 서울이 아닐때
            alert('서울이 아닌데?');
            return;
        }

    } else if (status === daum.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === daum.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

function owlSearch() {
    $('[class*=owl-search-].owl-carousel').each(function () {
        $(this).owlCarousel({
            items: 1,
            loop: true,
            margin: 10,
            autoHeight: true,
            lazyLoad: true,
            nav: true,
            navText: [
                "<i class='fa fa-angle-left'></i>",
                "<i class='fa fa-angle-right'></i>"
            ],
            dots: false,
            autoplay: false,
            autoplayTimeout: 5000,
            autoplayHoverPause: true,
            responsive: {
                0: {
                    items: 1
                },
                600: {
                    items: 1
                },
                1000: {
                    items: 1
                }
            }
        });
    });
}

function initButtons(button) {
    const buttons = $(button).closest('tbody').find('.roomSelect');
    buttons.removeClass('active');
    buttons.addClass('btn-primary');
}

function addRoomInfo(button) {
    $(button).addClass('active');
        $(button).removeClass('btn-primary');
        const hotelId = $(button).next().val(); // hotel Id
        const roomNum = $(button).next().next().val(); // room num
        const roomName = $(button).next().next().next().val(); // room Name
        $(`#roomSelected${hotelId}-${roomNum}`).val(`${hotelId}-${roomName}`);
}

function eventRegist() {
    $('#roomNumber').on('mousedown', function () {
        $('#roomNumberHidden').val(parseInt(this.value));
    });

    $('#roomNumber').on('change', function () {
        changeRoomNumberJjw(this);
    });

    $('#roomNumber2').on('mousedown', function () {
        $('#roomNumberHidden').val(parseInt(this.value));
    });

    $('#roomNumber2').on('change', function () {
        changeRoomNumber2Jjw(this);
    });

    $('#searchHotelButton').on('click', function () {
        if ($('#searchValueType').val() === 'searchLocation') {
            searchPlaces();
        } else {
            $('#searchValueInputHidden').val($('#searchValueInput').val());
        }

        setTimeout(() => {
            $('#searchForm').submit();
        }, 500);
    });

    $('#searchExtra').on('click', function () {
        $('.extraSearch').find('input:text').each(function () {
            $(this).val('');
        });
    });

    $('.modal').on('show.bs.modal', function () {
        window.dispatchEvent(new Event('resize'));
    });

    $('.modal').on('shown.bs.modal', function () {
        setTimeout(() => {
            owl.trigger('prev.owl.carousel');
        }, 300);
    });

    $('.roomSelect').on('click', function () {
        initButtons(this);
        addRoomInfo(this);
    });
}

var owl = $('.owl-carousel');

$(function () {
    eventRegist();

    setDatetimepickerSetting();

    calculateDayJjw();
    
    owlSearch();
});