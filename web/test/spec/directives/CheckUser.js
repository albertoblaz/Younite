'use strict';

describe('Directive: CheckUser', function () {

  // load the directive's module
  beforeEach(module('webApp'));

  var element,
    scope;

  beforeEach(inject(function ($rootScope) {
    scope = $rootScope.$new();
  }));

  it('should make hidden element visible', inject(function ($compile) {
    element = angular.element('<-check-user></-check-user>');
    element = $compile(element)(scope);
    expect(element.text()).toBe('this is the CheckUser directive');
  }));
});
