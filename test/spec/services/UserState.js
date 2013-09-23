'use strict';

describe('Service: UserState', function () {

  // load the service's module
  beforeEach(module('webApp'));

  // instantiate service
  var UserState;
  beforeEach(inject(function (_UserState_) {
    UserState = _UserState_;
  }));

  it('should do something', function () {
    expect(!!UserState).toBe(true);
  });

});
