<!DOCTYPE HTML>
<html lang="en">
<head>
<meta  charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php echo $title?></title> 

<!-- Favicons -->
<link rel="shortcut icon" href="<?php echo base_url()?>assets/img/fav.png">
<link rel="apple-touch-icon" href="<?php echo base_url()?>assets/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72" href="<?php echo base_url()?>assets/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114" href="<?php echo base_url()?>assets/apple-touch-icon-114x114.png">

<!-- Styles -->
<link href="https://fonts.googleapis.com/css?family=Oswald:300,400,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
<link href="<?php echo base_url()?>assets/css/style.css" rel="stylesheet" media="screen">
</head>
<body>
  
    <!-- Loader -->

    <!-- <div class="loader">
      <div class="page-lines">
        <div class="container">
          <div class="col-line col-xs-4">
            <div class="line"></div>
          </div>
          <div class="col-line col-xs-4">
            <div class="line"></div>
          </div>
          <div class="col-line col-xs-4">
            <div class="line"></div>
            <div class="line"></div>
          </div>
        </div>
      </div>
      <div class="loader-brand"> 
        <div class="sk-folding-cube">
          <div class="sk-cube1 sk-cube"></div>
          <div class="sk-cube2 sk-cube"></div>
          <div class="sk-cube4 sk-cube"></div>
          <div class="sk-cube3 sk-cube"></div>
        </div>
      </div>
    </div> -->

    <!-- Header -->

    <header id="top" class="header-home">
      <div class="brand-panel">
        <a href="<?php echo base_url()?>" class="brand js-target-scroll">
         <!--  Dubai<span class="text-primary">.</span> Stone -->
         <img src="<?php echo base_url()?>assets/img/logo.png" alt="logo" class="img-responsive">
        </a>
        <div class="brand-name">WEBSITE NAME</div>
        <div class="slide-number">
          <span class="current-number text-primary">0<span class="count">1</span></span>
          <sup><span class="delimiter">/</span> 0<span class="total-count"></span></sup>
        </div>
      </div>
      <div class="header-phone">888.888.88888</div>
      <div class="vertical-panel"></div>
      <div class="vertical-panel-content">
        <div class="vertical-panel-info">
            <div class="vertical-panel-title">WEBSITE NAME</div>
            <div class="line"></div>
         </div>
        <ul class="social-list">
          <li><a href="" class="fa fa-instagram"></a></li>
          <li><a href="" class="fa fa-twitter"></a></li>
          <li><a href="" class="fa fa-behance"></a></li>
          <li><a href="" class="fa fa-facebook"></a></li>
         </ul>  
      </div> 

      <!-- Navigation Desctop -->

      <nav class="navbar-desctop visible-md visible-lg">
        <div class="container">
          <a href="<?php echo base_url()?>" class="brand js-target-scroll">
            <!-- go<span class="text-primary">.</span>arch -->
            <img src="<?php echo base_url()?>assets/img/fav.png" alt="sticky logo" class="img-responsive sticky-logo">
          </a>
          <ul class="nav navbar-desctop-menu">
            <li>
              <a href="<?php echo base_url()?>">Home</a>
            </li>
            <li>
              <a href="<?php echo base_url()?>about-us">About</a>
            </li> 
            <li>
              <a href="<?php echo base_url()?>services">Services</a>
            </li>
            <li>
              <a href="<?php echo base_url()?>contact-us">Contacts</a>
            </li>
          </ul>
        </div>
      </nav>

      <!-- Navigation Mobile -->

      <nav class="nav navbar-mobile">
        <a href="<?php echo base_url()?>" class="brand js-target-scroll">
          <!-- go<span class="text-primary">.</span>arch -->
          <img src="<?php echo base_url()?>assets/img/fav.png" alt="sticky logo" class="img-responsive sticky-logo">
        </a>

        <!-- Navbar Collapse -->

        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-mobile">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbar-mobile"> 
          <ul class="navbar-nav-mobile">
            <li class="active">
              <a href="<?php echo base_url()?>">Home</a>
            </li>
            <li>
              <a href="<?php echo base_url()?>about-us">About</a>
            </li>
            <li>
              <a href="<?php echo base_url()?>services">Services</a>
            </li>
            <li>
              <a href="<?php echo base_url()?>contact-us">Contacts</a>
            </li>
          </ul>
        </div>
      </nav> 
    </header>