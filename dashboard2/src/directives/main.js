'use strict';

/* Directives */


var mainDirectives = angular.module('app.directives', []);

mainDirectives.directive('scrollTop',[ function() {
        return {
            link: function(scope, element, attrs) {
                $('#back-to-top').hide();

                $(function(){
                    $(window).scroll(function(){
                       if ($(this).scrollTop() > 200){
                           $('#back-to-top').fadeIn();
                       }else{
                           $('#back-to-top').fadeOut();
                       }
                    });
                });

                 $('#back-to-top').click(function(){
                    $('body,html').animate({
                       scrollTop: 0
                    }, 300);
                    return false;
                 });

            }
        };
    }]);

mainDirectives.directive('donut',[ function() {
        return {
            link: function(scope, element, attrs) {
              $(function () {
                console.log('hoa');

                var data = [];
                var series = 3;
                for( var i = 0; i<series; i++)
                {
                  data[i] = { label: "Series "+(i+1), data: Math.floor(Math.random()*100)+1 }
                }

                $.plot($("#donut-chart"), data,
                  {
                    colors: ["#F90", "#222", "#777", "#AAA"],
                          series: {
                              pie: {
                                  innerRadius: 0.5,
                                  show: true
                              }
                          }
                  });
              });
            }
        };
    }]);
