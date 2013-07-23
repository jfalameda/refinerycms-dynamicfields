//= require jquery_nested_form

(function(window, $) {

	/**
	* This objects manages the dynamic form
	* creation.
	*/
	var DynamicFieldsNew = function() {
		this.init();
	};
	DynamicFieldsNew.prototype = {
		/**
		* Constructor
		*/
		init: function() {
			// Checks if the dynamic field is presend on the DOM
			// and if it is, it proceed to initilize the functionality.
			if($("[data-dynamic-field-new]").length > 0) {
				this.addObservers();
			}
		},
		/**
		* Adds observers over the DOM elements
		*/
		addObservers: function() {
			var $this = this;
			$(".dynamic-fields-criteria-group").click(function(e) {
				$this.onCriteriaSelectionClicked($(this));
			});
		},

		/**
		* This function is triggered once the user clicks on
		* a criteria selection select. It takes care of displaying
		* the selected criteria panel and hide the previous selected.
		* @param element The clicked element
		*/
		onCriteriaSelectionClicked: function(element) {

			// Finding the input select belongin to the criteria group
			element.find("[name=criteria-selection]").prop('checked',true);

			// Finding the criteria selection main container
			// in order to find all the active children elements
			var selection = element.parents(".dynamic-fields-criteria-selection");

			// Removing the previously selected active field
			selection.find(".field.active").removeClass("active");

			// Marking the new selected field
			element.find(".field").addClass("active");
		}


	};

	// Initialize the modules once the document
	// is ready.
	$(function() {
		new DynamicFieldsNew();
	});

})(window, jQuery);
