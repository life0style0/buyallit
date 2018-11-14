function sendServer(button) {
    let review;
    if ($(button).hasClass('review-like')) {
        review = 'like';
    } else if ($(button).hasClass('review-hate')) {
        review = 'hate';
    } else {
        return false;
    }
    const reviewId = $(button).closest('.media-right').find('input[name="reviewId"]').val();
    const userId = $('#userId').val();
    if (!userId) {
        const reserveB = $(button).closest('.modal-body').next().find('.reservationButton');
        reserveB.prev().remove();
        reserveB.before(`<div class="alert alert-danger alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><a class="alert-link room-login-alert" data-toggle="modal" data-target="#loginModal"><strong>로그인</strong></a>을 하셔야 선택할 수 있습니다.</div>`);
        $(button).closest('.modal').animate({ scrollTop: reserveB.offset().top * 3 }, 400);
        return;
    }

    const param = {
        type: review,
        reviewId: reviewId,
        userId: userId
    };
    $.ajax({
        url: "/reservationmall/hotel/review.mall",
        data: param,
        dataType: "text", //응답결과로 반환되는 데이터타입(text, html, xml, html, json)
        success: function (data) {
            $(button).children().toggleClass('far');
            $(button).children().toggleClass('fas');
            if ($(button).hasClass('review-like')) {
                $(button).closest('.media').find('.label-large').children().eq(0).text(data);
            }
        },
        error: function (xhr, statusText) {
            alert("(" + xhr.status + ", " + statusText + ")");
        }
    });


}

$(function () {
    $('.review-like').on('click', function () {
        sendServer(this);
        return false;
    });
    $('.review-hate').on('click', function () {
        sendServer(this);
        return false;
    });
});