//= require jquery_nested_form

(function(window, $) {

	/**
	* Implements the page tabs javascript
	* functionality
	*/
	var DynamicFieldsPageTab = function() {
		this.init();
	}; DynamicFieldsPageTab.prototype = {
		/**
		* Constructor
		*/
		init: function() {
			var $this = this;
			if($("[id='custom_Custom fields_tab']").length > 0) {
				$this.hideTabIfNotModels();
			}
		},

		/**
		* Hides the tab in case no models have been
		* assined to the current page.
		*/
		hideTabIfNotModels: function() {
			if(window["dynamicfields_tabNoResults"] === true) {
				$("[id='custom_Custom fields_tab']").hide();
			}
		}
	};

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
				this.markDefaultWhenEdit();
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
			$("[data-field-id-source]").on("keyup input paste", function() {
				$this.updateFieldId($(this));
			});
		},

		/**
		* Marks the default criteria group when editing a dynamic field
		*/
		markDefaultWhenEdit: function() {
			var value = $("#dynamicfield_criteria").val();
			$("[data-criteria-group="+value+"]").click();
		},
		/**
		* Generates automatically an ID based on the field
		* name and inserts it on the id field.
		* @param element The clicked element
		*/
		updateFieldId: function(element) {
			value = this.generateId(element.val());
			element.parents(".item").find("[data-field-id]").val(value);
		},

		/**
		* Generates an ID for a given string
		* @param str The string
		*/
		generateId: function(str) {
    	var re = /[^a-z0-9]+/gi; // global and case insensitive matching of non-char/non-numeric
    	var re2 = /^-*|-*$/g;     // get rid of any leading/trailing dashes
    	str = str.replace(re, '_');  // perform the 1st regexp
    	return str.replace(re2, '').toLowerCase();
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

			// Extracting the criteria value
			var value = element.find("[name=criteria-selection]").val();

			// Finding the criteria selection main container
			// in order to find all the active children elements
			var selection = element.parents(".dynamic-fields-criteria-selection");

			// Removing the previously selected active field
			selection.find(".field.active").removeClass("active");

			// Marking the new selected field
			element.find(".field").addClass("active");

			this.setCriteriaOnField(value);
		},

		/**
		* Stores the selected criteria on a hidden
		* field in order to be stored on the model.
		* @param value The selected criteria
		*/
		setCriteriaOnField: function(value) {
			$("#dynamicfield_criteria").val(value)
		}


	};

	// Initialize the modules once the document
	// is ready.
	$(function() {
		new DynamicFieldsNew();
		new DynamicFieldsPageTab();
	});

})(window, jQuery);
