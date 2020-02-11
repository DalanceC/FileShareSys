<%--
  Created by IntelliJ IDEA.
  User: 82607
  Date: 2019/5/3
  Time: 2:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        pageContext.setAttribute("SourcePath", request.getContextPath());
    %>
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <link rel="shortcut icon" href="${SourcePath}/static/pic/mini.png"/>
    <title>error</title>
        <style>
            body {
                min-width: 320px;
                background: #333
            }

            #head-body {
                position: relative;
                z-index: 2;
                margin: 25px 0 50px 0;
                width: 200px;
                height: 0;
                border-top: 150px solid #555;
                border-right: 25px solid transparent;
                border-left: 25px solid transparent
            }

            #head-body:after {
                position: absolute;
                top: 0;
                left: 0;
                width: 0;
                height: 0;
                border-color: #555 transparent transparent transparent;
                border-style: solid;
                border-width: 150px 100px 0 100px;
                content: ""
            }

            #head-eye {
                position: relative;
                top: -585px;
                left: 67px;
                z-index: 12;
                width: 32px;
                height: 22px;
                background: #4CBEFF;
                box-shadow: rgba(255, 255, 255, .4) 0 0 15px, rgba(76, 190, 255, .95) 0 0 10px;
                -webkit-transform: skew(46deg) rotate(14deg);
                -moz-transform: skew(46deg) rotate(14deg);
                -o-transform: skew(46deg) rotate(14deg)
            }

            #head-eye-2 {
                position: relative;
                top: -607px;
                left: 150px;
                z-index: 12;
                width: 32px;
                height: 22px;
                background: #4CBEFF;
                box-shadow: rgba(255, 255, 255, .4) 0 0 15px, rgba(76, 190, 255, .95) 0 0 10px;
                -webkit-transform: skew(-46deg) rotate(-14deg);
                -moz-transform: skew(-46deg) rotate(-14deg);
                -o-transform: skew(-46deg) rotate(-14deg)
            }

            #head-topcover {
                position: relative;
                top: -225px;
                left: -19px;
                z-index: 5;
                width: 169px;
                height: 0;
                border-top: 80px solid #333;
                border-right: 60px solid transparent;
                border-left: 60px solid transparent
            }

            #head-topcover:after {
                position: absolute;
                top: 0;
                left: 0;
                width: 0;
                height: 0;
                border-color: #333 transparent transparent transparent;
                border-style: solid;
                border-width: 15px 85px 0 85px;
                content: ""
            }

            #head-toplogo-bg {
                position: relative;
                top: -267px;
                left: 67px;
                z-index: 6;
                width: 46px;
                height: 0;
                border-top: 110px solid #333;
                border-right: 35px solid transparent;
                border-left: 35px solid transparent
            }

            #head-toplogo-bg:after {
                position: absolute;
                top: 0;
                left: 0;
                width: 0;
                height: 0;
                border-color: #333 transparent transparent transparent;
                border-style: solid;
                border-width: 30px 23px 0 23px;
                content: ""
            }

            #head-toplogo {
                position: relative;
                top: -377px;
                left: 75px;
                z-index: 7;
                width: 40px;
                height: 0;
                border-top: 105px solid #555;
                border-right: 30px solid transparent;
                border-left: 30px solid transparent
            }

            #head-toplogo:before {
                position: absolute;
                top: -42px;
                left: 10px;
                display: block;
                width: 0;
                height: 0;
                border-top: 30px solid #333;
                border-right: 10px solid transparent;
                border-left: 10px solid transparent;
                content: ''
            }

            #head-toplogo:after {
                position: absolute;
                top: 0;
                left: 0;
                width: 0;
                height: 0;
                border-color: #555 transparent transparent transparent;
                border-style: solid;
                border-width: 28px 20px 0 20px;
                content: ""
            }

            #head-toplogo-2 {
                position: relative;
                top: -482px;
                left: 75px;
                z-index: 8;
                width: 30px;
                height: 0;
                border-top: 37px solid #333;
                border-right: 35px solid transparent;
                border-left: 35px solid transparent
            }

            #head-bottom {
                position: relative;
                top: -365px;
                left: -31px;
                z-index: 10;
                display: block;
                margin: 50px 0;
                width: 0;
                height: 0;
                border-right: 107px solid transparent;
                border-bottom: 44px solid #555;
                border-left: 60px solid transparent;
                color: #555;
                -webkit-transform: rotate(236deg);
                -moz-transform: rotate(236deg);
                -o-transform: rotate(236deg);
                -ms-transform: rotate(236deg)
            }

            #head-bottom-2 {
                position: relative;
                top: -460px;
                left: 115px;
                display: block;
                width: 0;
                height: 0;
                border-right: 60px solid transparent;
                border-bottom: 44px solid #555;
                border-left: 107px solid transparent;
                color: #555;
                -webkit-transform: rotate(484deg);
                -moz-transform: rotate(484deg);
                -o-transform: rotate(484deg);
                -ms-transform: rotate(484deg)
            }

            #head-sw {
                position: relative;
                top: -629px;
                left: 45px;
                z-index: 15;
                width: 49px;
                height: 8px;
                background: #333;
                -webkit-transform: skew(-149deg) rotate(9deg);
                -moz-transform: skew(-149deg) rotate(9deg);
                -o-transform: skew(-149deg) rotate(9deg)
            }

            #head-sw:after {
                position: absolute;
                top: 24px;
                left: -6px;
                width: 53px;
                height: 8px;
                background: #333;
                content: "";
                -webkit-transform: skew(-174deg) rotate(1deg);
                -moz-transform: skew(-174deg) rotate(1deg);
                -o-transform: skew(-174deg) rotate(1deg)
            }

            #head-sw-2 {
                position: relative;
                top: -637px;
                left: 155px;
                z-index: 15;
                width: 49px;
                height: 8px;
                background: #333;
                -webkit-transform: skew(279deg) rotate(10deg);
                -moz-transform: skew(279deg) rotate(10deg);
                -o-transform: skew(279deg) rotate(10deg)
            }

            #head-sw-2:after {
                position: absolute;
                top: -2px;
                left: 132px;
                width: 45px;
                height: 9px;
                background: #333;
                content: "";
                -webkit-transform: skew(-212deg) rotate(0);
                -moz-transform: skew(-212deg) rotate(0);
                -o-transform: skew(-212deg) rotate(0)
            }

            #t-ov {
                overflow: hidden;
                margin: 50px auto 20px auto;
                width: 250px;
                height: 325px
            }

            .motime #head-body {
                animation: head-body-1 4s cubic-bezier(.25, .1, .25, 1);
                -moz-animation: head-body-1 4s cubic-bezier(.25, .1, .25, 1);
                -webkit-animation: head-body-1 4s cubic-bezier(.25, .1, .25, 1);
                -o-animation: head-body-1 4s cubic-bezier(.25, .1, .25, 1)
            }

            @keyframes head-body-1 {
                0% {
                    top: 350px;
                    border-top: 150px solid #555;
                    border-right: 25px solid transparent;
                    border-left: 25px solid transparent
                }
                100% {
                    top: 0;
                    border-top: 150px solid #555;
                    border-right: 25px solid transparent;
                    border-left: 25px solid transparent
                }
            }

            @-moz-keyframes head-body-1 {
                0% {
                    top: 350px;
                    border-top: 150px solid #555;
                    border-right: 25px solid transparent;
                    border-left: 25px solid transparent
                }
                100% {
                    top: 0;
                    border-top: 150px solid #555;
                    border-right: 25px solid transparent;
                    border-left: 25px solid transparent
                }
            }

            @-webkit-keyframes head-body-1 {
                0% {
                    top: 350px;
                    border-top: 150px solid #555;
                    border-right: 25px solid transparent;
                    border-left: 25px solid transparent
                }
                100% {
                    top: 0;
                    border-top: 150px solid #555;
                    border-right: 25px solid transparent;
                    border-left: 25px solid transparent
                }
            }

            @-o-keyframes head-body-1 {
                0% {
                    top: 350px;
                    border-top: 150px solid #555;
                    border-right: 25px solid transparent;
                    border-left: 25px solid transparent
                }
                100% {
                    top: 0;
                    border-top: 150px solid #555;
                    border-right: 25px solid transparent;
                    border-left: 25px solid transparent
                }
            }

            .motime #head-toplogo {
                animation: head-body-2 2s cubic-bezier(.25, .1, .25, 1);
                -moz-animation: head-body-2 2s cubic-bezier(.25, .1, .25, 1);
                -webkit-animation: head-body-2 2s cubic-bezier(.25, .1, .25, 1);
                -o-animation: head-body-2 2s cubic-bezier(.25, .1, .25, 1)
            }

            @keyframes head-body-2 {
                0% {
                    top: -600px
                }
                100% {
                    top: -377px
                }
            }

            @-moz-keyframes head-body-2 {
                0% {
                    top: -600px
                }
                100% {
                    top: -377px
                }
            }

            @-webkit-keyframes head-body-2 {
                0% {
                    top: -600px
                }
                100% {
                    top: -377px
                }
            }

            @-o-keyframes head-body-2 {
                0% {
                    top: -600px
                }
                100% {
                    top: -377px
                }
            }

            .motime #head-toplogo-2 {
                animation: head-body-3 4s cubic-bezier(1, .5, .25, .1);
                -moz-animation: head-body-3 4s cubic-bezier(1, .5, .25, .1);
                -webkit-animation: head-body-3 4s cubic-bezier(1, .5, .25, .1);
                -o-animation: head-body-3 4s cubic-bezier(1, .5, .25, .1)
            }

            @keyframes head-body-3 {
                0% {
                    top: -800px
                }
                100% {
                    top: -482px
                }
            }

            @-moz-keyframes head-body-3 {
                0% {
                    top: -800px
                }
                100% {
                    top: -482px
                }
            }

            @-webkit-keyframes head-body-3 {
                0% {
                    top: -800px
                }
                100% {
                    top: -482px
                }
            }

            @-o-keyframes head-body-3 {
                0% {
                    top: -800px
                }
                100% {
                    top: -482px
                }
            }

            .motime #head-eye, .motime #head-eye-2 {
                animation: head-body-4 5s cubic-bezier(1, 1, .5, .005);
                -moz-animation: head-body-4 5s cubic-bezier(1, 1, .5, .005);
                -webkit-animation: head-body-4 5s cubic-bezier(1, 1, .5, .005);
                -o-animation: head-body-4 5s cubic-bezier(1, 1, .5, .005)
            }

            @keyframes head-body-4 {
                0% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                5% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                10% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                15% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                20% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                25% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                30% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                35% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                40% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                45% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                50% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                55% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                60% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                65% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                70% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                75% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                80% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                85% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                90% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                95% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                100% {
                    background: #4CBEFF;
                    -webkit-box-shadow: rgba(255, 255, 255, .4) 0 0 35px, rgba(76, 190, 255, .95) 0 0 25px;
                    -moz-box-shadow: rgba(255, 255, 255, .4) 0 0 35px, rgba(76, 190, 255, .95) 0 0 25px;
                    box-shadow: rgba(255, 255, 255, .4) 0 0 35px, rgba(76, 190, 255, .95) 0 0 25px
                }
            }

            @-moz-keyframes head-body-4 {
                0% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                5% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                10% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                15% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                20% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                25% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                30% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                35% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                40% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                45% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                50% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                55% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                60% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                65% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                70% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                75% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                80% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                85% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                90% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                95% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                100% {
                    background: #4CBEFF;
                    -webkit-box-shadow: rgba(255, 255, 255, .4) 0 0 35px, rgba(76, 190, 255, .95) 0 0 25px;
                    -moz-box-shadow: rgba(255, 255, 255, .4) 0 0 35px, rgba(76, 190, 255, .95) 0 0 25px;
                    box-shadow: rgba(255, 255, 255, .4) 0 0 35px, rgba(76, 190, 255, .95) 0 0 25px
                }
            }

            @-webkit-keyframes head-body-4 {
                0% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                5% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                10% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                15% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                20% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                25% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                30% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                35% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                40% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                45% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                50% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                55% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                60% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                65% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                70% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                75% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                80% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                85% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                90% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                95% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                100% {
                    background: #4CBEFF;
                    -webkit-box-shadow: rgba(255, 255, 255, .4) 0 0 35px, rgba(76, 190, 255, .95) 0 0 25px;
                    -moz-box-shadow: rgba(255, 255, 255, .4) 0 0 35px, rgba(76, 190, 255, .95) 0 0 25px;
                    box-shadow: rgba(255, 255, 255, .4) 0 0 35px, rgba(76, 190, 255, .95) 0 0 25px
                }
            }

            @-o-keyframes head-body-4 {
                0% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                5% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                10% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                15% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                20% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                25% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                30% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                35% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                40% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                45% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                50% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                55% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                60% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                65% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                70% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                75% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                80% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                85% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                90% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                95% {
                    background: 0 0;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    box-shadow: none
                }
                100% {
                    background: #4CBEFF;
                    -webkit-box-shadow: rgba(255, 255, 255, .4) 0 0 35px, rgba(76, 190, 255, .95) 0 0 25px;
                    -moz-box-shadow: rgba(255, 255, 255, .4) 0 0 35px, rgba(76, 190, 255, .95) 0 0 25px;
                    box-shadow: rgba(255, 255, 255, .4) 0 0 35px, rgba(76, 190, 255, .95) 0 0 25px
                }
            }

            .motime #head-bottom {
                animation: head-body-5 3s cubic-bezier(.1, .025, .005, .005);
                -moz-animation: head-body-5 3s cubic-bezier(.1, .025, .005, .005);
                -webkit-animation: head-body-5 3s cubic-bezier(.1, .025, .005, .005);
                -o-animation: head-body-5 3s cubic-bezier(.1, .025, .005, .005)
            }

            @keyframes head-body-5 {
                0% {
                    left: 300px
                }
                50% {
                    left: -120px
                }
                100% {
                    left: -31px
                }
            }

            @-moz-keyframes head-body-5 {
                0% {
                    left: 300px
                }
                50% {
                    left: -120px
                }
                100% {
                    left: -31px
                }
            }

            @-webkit-keyframes head-body-5 {
                0% {
                    left: 300px
                }
                50% {
                    left: -120px
                }
                100% {
                    left: -31px
                }
            }

            @-o-keyframes head-body-5 {
                0% {
                    left: 300px
                }
                50% {
                    left: -120px
                }
                100% {
                    left: -31px
                }
            }

            .motime #head-bottom-2 {
                animation: head-body-6 3s cubic-bezier(.1, .025, .005, .005);
                -moz-animation: head-body-6 3s cubic-bezier(.1, .025, .005, .005);
                -webkit-animation: head-body-6 3s cubic-bezier(.1, .025, .005, .005);
                -o-animation: head-body-6 3s cubic-bezier(.1, .025, .005, .005)
            }

            @keyframes head-body-6 {
                0% {
                    left: -300px
                }
                50% {
                    left: 300px
                }
                100% {
                    left: 115px
                }
            }

            @-moz-keyframes head-body-6 {
                0% {
                    left: -300px
                }
                50% {
                    left: 300px
                }
                100% {
                    left: 115px
                }
            }

            @-webkit-keyframes head-body-6 {
                0% {
                    left: -300px
                }
                50% {
                    left: 300px
                }
                100% {
                    left: 115px
                }
            }

            @-o-keyframes head-body-6 {
                0% {
                    left: -300px
                }
                50% {
                    left: 300px
                }
                100% {
                    left: 115px
                }
            }

            .motime #head-toplogo:before {
                animation: head-body-7 3s cubic-bezier(1, 1, .005, .005);
                -moz-animation: head-body-7 3s cubic-bezier(1, 1, .005, .005);
                -webkit-animation: head-body-7 3s cubic-bezier(1, 1, .5, .005);
                -o-animation: head-body-7 3s cubic-bezier(1, 1, .005, .005)
            }

            @keyframes head-body-7 {
                0% {
                    border-top: 30px solid #555
                }
                5% {
                    border-top: 30px solid #555
                }
                10% {
                    border-top: 30px solid #555
                }
                15% {
                    border-top: 30px solid #555
                }
                20% {
                    border-top: 30px solid #555
                }
                25% {
                    border-top: 30px solid #555
                }
                30% {
                    border-top: 30px solid #555
                }
                35% {
                    border-top: 30px solid #555
                }
                40% {
                    border-top: 30px solid #555
                }
                45% {
                    border-top: 30px solid #555
                }
                50% {
                    border-top: 30px solid #555
                }
                55% {
                    border-top: 30px solid #555
                }
                60% {
                    border-top: 30px solid #555
                }
                65% {
                    border-top: 30px solid #555
                }
                70% {
                    border-top: 30px solid #555
                }
                75% {
                    border-top: 30px solid #555
                }
                80% {
                    border-top: 30px solid #555
                }
                85% {
                    border-top: 30px solid #555
                }
                90% {
                    border-top: 30px solid #333
                }
                95% {
                    border-top: 30px solid #555
                }
                100% {
                    border-top: 30px solid #333
                }
            }

            @-moz-keyframes head-body-7 {
                0% {
                    border-top: 30px solid #555
                }
                5% {
                    border-top: 30px solid #555
                }
                10% {
                    border-top: 30px solid #555
                }
                15% {
                    border-top: 30px solid #555
                }
                20% {
                    border-top: 30px solid #555
                }
                25% {
                    border-top: 30px solid #555
                }
                30% {
                    border-top: 30px solid #555
                }
                35% {
                    border-top: 30px solid #555
                }
                40% {
                    border-top: 30px solid #555
                }
                45% {
                    border-top: 30px solid #555
                }
                50% {
                    border-top: 30px solid #555
                }
                55% {
                    border-top: 30px solid #555
                }
                60% {
                    border-top: 30px solid #555
                }
                65% {
                    border-top: 30px solid #555
                }
                70% {
                    border-top: 30px solid #555
                }
                75% {
                    border-top: 30px solid #555
                }
                80% {
                    border-top: 30px solid #555
                }
                85% {
                    border-top: 30px solid #555
                }
                90% {
                    border-top: 30px solid #333
                }
                95% {
                    border-top: 30px solid #555
                }
                100% {
                    border-top: 30px solid #333
                }
            }

            @-webkit-keyframes head-body-7 {
                0% {
                    border-top: 30px solid #555
                }
                5% {
                    border-top: 30px solid #555
                }
                10% {
                    border-top: 30px solid #555
                }
                15% {
                    border-top: 30px solid #555
                }
                20% {
                    border-top: 30px solid #555
                }
                25% {
                    border-top: 30px solid #555
                }
                30% {
                    border-top: 30px solid #555
                }
                35% {
                    border-top: 30px solid #555
                }
                40% {
                    border-top: 30px solid #555
                }
                45% {
                    border-top: 30px solid #555
                }
                50% {
                    border-top: 30px solid #555
                }
                55% {
                    border-top: 30px solid #555
                }
                60% {
                    border-top: 30px solid #555
                }
                65% {
                    border-top: 30px solid #555
                }
                70% {
                    border-top: 30px solid #555
                }
                75% {
                    border-top: 30px solid #555
                }
                80% {
                    border-top: 30px solid #555
                }
                85% {
                    border-top: 30px solid #555
                }
                90% {
                    border-top: 30px solid #333
                }
                95% {
                    border-top: 30px solid #555
                }
                100% {
                    border-top: 30px solid #333
                }
            }

            @-o-keyframes head-body-7 {
                0% {
                    border-top: 30px solid #555
                }
                5% {
                    border-top: 30px solid #555
                }
                10% {
                    border-top: 30px solid #555
                }
                15% {
                    border-top: 30px solid #555
                }
                20% {
                    border-top: 30px solid #555
                }
                25% {
                    border-top: 30px solid #555
                }
                30% {
                    border-top: 30px solid #555
                }
                35% {
                    border-top: 30px solid #555
                }
                40% {
                    border-top: 30px solid #555
                }
                45% {
                    border-top: 30px solid #555
                }
                50% {
                    border-top: 30px solid #555
                }
                55% {
                    border-top: 30px solid #555
                }
                60% {
                    border-top: 30px solid #555
                }
                65% {
                    border-top: 30px solid #555
                }
                70% {
                    border-top: 30px solid #555
                }
                75% {
                    border-top: 30px solid #555
                }
                80% {
                    border-top: 30px solid #555
                }
                85% {
                    border-top: 30px solid #555
                }
                90% {
                    border-top: 30px solid #333
                }
                95% {
                    border-top: 30px solid #555
                }
                100% {
                    border-top: 30px solid #333
                }
            }

            .wrap {
                margin: 0 auto;
                width: 200px;
                height: 80px
            }

            .loading {
                position: relative;
                width: 185px;
                height: 20px;
                color: #4CBEFF;
                text-align: right;
                text-shadow: 0 0 6px #bce4ff;
                text-shadow: rgba(255, 255, 255, .4) 0 0 35px, rgba(76, 190, 255, .95) 0 0 25px;
                font-family: arial
            }

            .loading span {
                position: absolute;
                right: 30px;
                display: block;
                width: 200px;
                height: 20px;
                text-transform: uppercase;
                line-height: 20px
            }

            .loading span:after {
                position: absolute;
                top: -2px;
                right: -21px;
                display: block;
                width: 16px;
                height: 20px;
                background: #4CBEFF;
                -webkit-box-shadow: 0 0 15px #bce4ff;
                -moz-box-shadow: 0 0 15px #bce4ff;
                box-shadow: 0 0 15px #bce4ff;
                content: "";
                -moz-animation: blink 5s infinite;
                -webkit-animation: blink 5s infinite;
                animation: blink 5s infinite
            }

            .loading span.title {
                -moz-animation: title 12s linear infinite;
                -webkit-animation: title 12s linear infinite;
                animation: title 12s linear infinite
            }

            .loading span.text {
                opacity: 0;
                -moz-animation: title 12s linear 5s infinite;
                -webkit-animation: title 12s linear 5s infinite;
                animation: title 12s linear 5s infinite
            }

            @-webkit-keyframes title {
                0% {
                    right: 130px;
                    opacity: 0
                }
                48% {
                    right: 130px;
                    opacity: 0
                }
                52% {
                    right: 30px;
                    opacity: 1
                }
                70% {
                    right: 30px;
                    opacity: 1
                }
                100% {
                    right: 30px;
                    opacity: 0
                }
            }

            @-moz-keyframes title {
                0% {
                    right: 130px;
                    opacity: 0
                }
                48% {
                    right: 130px;
                    opacity: 0
                }
                52% {
                    right: 30px;
                    opacity: 1
                }
                70% {
                    right: 30px;
                    opacity: 1
                }
                100% {
                    right: 30px;
                    opacity: 0
                }
            }

            @-webkit-keyframes fade {
                0% {
                    opacity: 1
                }
                100% {
                    opacity: 0
                }
            }

            @-moz-keyframes fade {
                0% {
                    opacity: 1
                }
                100% {
                    opacity: 0
                }
            }

            @-webkit-keyframes bg {
                0% {
                    background-color: #306f99
                }
                50% {
                    background-color: #19470f
                }
                90% {
                    background-color: #734a10
                }
            }

            @-moz-keyframes bg {
                0% {
                    background-color: #306f99
                }
                50% {
                    background-color: #19470f
                }
                90% {
                    background-color: #734a10
                }
            }

            @-webkit-keyframes blink {
                0% {
                    opacity: 0
                }
                5% {
                    opacity: 1
                }
                10% {
                    opacity: 0
                }
                15% {
                    opacity: 1
                }
                20% {
                    opacity: 0
                }
                25% {
                    opacity: 1
                }
                30% {
                    opacity: 0
                }
                35% {
                    opacity: 1
                }
                40% {
                    right: -21px;
                    opacity: 0
                }
                45% {
                    right: 80px;
                    opacity: 1
                }
                50% {
                    right: -21px;
                    opacity: 0
                }
                51% {
                    right: -21px
                }
                55% {
                    opacity: 1
                }
                60% {
                    opacity: 0
                }
                65% {
                    opacity: 1
                }
                70% {
                    opacity: 0
                }
                75% {
                    opacity: 1
                }
                80% {
                    opacity: 0
                }
                85% {
                    opacity: 1
                }
                90% {
                    right: -21px;
                    opacity: 0
                }
                95% {
                    right: 80px;
                    opacity: 1
                }
                96% {
                    right: -21px
                }
                100% {
                    right: -21px;
                    opacity: 0
                }
            }

            @-moz-keyframes blink {
                0% {
                    opacity: 0
                }
                5% {
                    opacity: 1
                }
                10% {
                    opacity: 0
                }
                15% {
                    opacity: 1
                }
                20% {
                    opacity: 0
                }
                25% {
                    opacity: 1
                }
                30% {
                    opacity: 0
                }
                35% {
                    opacity: 1
                }
                40% {
                    right: -21px;
                    opacity: 0
                }
                45% {
                    right: 80px;
                    opacity: 1
                }
                50% {
                    right: -21px;
                    opacity: 0
                }
                51% {
                    right: -21px
                }
                55% {
                    opacity: 1
                }
                60% {
                    opacity: 0
                }
                65% {
                    opacity: 1
                }
                70% {
                    opacity: 0
                }
                75% {
                    opacity: 1
                }
                80% {
                    opacity: 0
                }
                85% {
                    opacity: 1
                }
                90% {
                    right: -21px;
                    opacity: 0
                }
                95% {
                    right: 80px;
                    opacity: 1
                }
                96% {
                    right: -21px
                }
                100% {
                    right: -21px;
                    opacity: 0
                }
            }
        </style>
    </head>
    <body>
        <div id="t-ov">
            <div class="motime">
                <div id="head-body"></div>
                <div id="head-topcover"></div>
                <div id="head-toplogo-bg"></div>
                <div id="head-toplogo"></div>
                <div id="head-toplogo-2"></div>
                <div id="head-bottom"></div>
                <div id="head-bottom-2"></div>
                <div id="head-sw"></div>
                <div id="head-sw-2"></div>
                <div id="head-eye"></div>
                <div id="head-eye-2"></div>
            </div>
        </div>
        <iframe frameborder="0" scrolling="no" src="" width="100%" height="100px"></iframe>
        <h1 style="text-align:center">
            <span style="color:#555;font-family:'Microsoft YaHei'">糟糕，操作错误了</span></h1>
        <blockquote>
        </blockquote>
    </body>
</html>
