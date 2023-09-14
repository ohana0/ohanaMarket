<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Slick Slide Show Example</title>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <style>
        body {
            background: peachpuff;
        }

        .slider {
            width: 600px;
            margin: 0 auto;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
            border-radius: 10px;
        }

        .slick-dots {
            bottom: 10px;
        }

        .slick-dots li button:before {
            font-size: 10px;
            line-height: 10px;
            color: #fff;
        }
    </style>
</head>

<body>

    <div class="slider">
        <img src="https://picsum.photos/id/18/367/267" alt="Image 1">
        <img src="https://picsum.photos/id/19/367/267" alt="Image 2">
        <img src="https://picsum.photos/id/20/367/267" alt="Image 3">
        <img src="https://picsum.photos/id/21/367/267" alt="Image 4">
    </div>

<script>
    $('.slider').slick({
        autoplay: true,
        autoplaySpeed: 2000,
        dots: true,
        infinite: true,
        speed: 500,
        fade: true,
        cssEase: 'linear',
        adaptiveHeight: true
    });
</script>
</body>
</html>