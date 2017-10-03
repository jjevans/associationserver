<html>
	<head>
		<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
		<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
		<script src="../../js/jquery.tablesorter.js"></script> 
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
		<link rel="stylesheet" type="text/css" href="${files['main']['css']}"/>
		<link rel="stylesheet" type="text/css" href="${files['search']['css']}"/>
		
		####
		## search fields, autocomplete for disease, phenos, and genes
		####
		<script>
			## autocomplete dropdown form, diseases
			$(function() {
	    		var entries0 = [
					## duplicate each entry using term description as value and then id as value
					% for fd in sorted(form_dis):
						{value: "${form_dis[fd]}", label: "${fd}", desc: "${form_dis[fd]}"},
						{value: "${form_dis[fd]}", label: "${form_dis[fd]}", desc: "${form_dis[fd]}"},
		      		% endfor
	    		];
	    		$("#txt0").autocomplete({
					source: entries0,
					select: function(event,ui){
						$("#form0").submit(function(){
							$("#id0").val(ui.item.value);
							$("#lbl0").val(ui.item.label);
							$("#desc0").val(ui.item.desc);
							return true;
						})
					}
	    		})
	    		
			});
		</script>
		
		<script>
			## autocomplete dropdown form, phenotypes
			$(function() {
	    		var entries1 = [
					## duplicate each entry using term description as value and then id as value
					% for fp in sorted(form_pheno):
						{value: "${form_pheno[fp]}", label: "${fp}", desc: "${fp}"},
						{value: "${form_pheno[fp]}", label: "${form_pheno[fp]}", desc: "${fp}"},
		      		% endfor
	    		];
	    		$("#txt1").autocomplete({
					source: entries1,
					select: function(event,ui){
						$("#form1").submit(function(){
							$("#id1").val(ui.item.value);
							$("#lbl1").val(ui.item.label);
							$("#desc1").val(ui.item.desc);
							return true;
						})
					}
	    		})
	    		
			});
		</script>
		
		<script>
			## autocomplete dropdown form, genes
			$(function() {
	    		var entries2 = [
					% for fg in sorted(form_gene):
						{value: "${fg}", label: "${fg}", desc: ""},
					% endfor
					
					## got rid of tracking source in "description" field
					##% for fg in form_gene:
						##% for item in fg[1]: 
		      			##	{value: "${item}", label: "${item}", desc: "${fg[0]}"},
		      			##% endfor
					##% endfor
	    		];
	    		$("#txt2").autocomplete({
					source: entries2,
					select: function(event,ui){
						$("#form2").submit(function(){
							$("#id2").val(ui.item.value);
							$("#lbl2").val(ui.item.label);
							$("#desc2").val(ui.item.desc);
							return true;
						})
					}
	    		})
	    		
			});
		</script>

	</head>

	<body>
		####
		## background border
		####
		<div id="bg_frame">
			<img src="${image['directory']}/${bg}">
		</div>
	
		<div id="contents">
			####
			## banners
			####
			<div id="banners">
				<div id="pcpgm_banner">
					<img src="${image['directory']}/${image['banner']['pcpgm']}">
				</div>
				<div id="tool_banner">
					<img src="${image['directory']}/${image['banner']['tool']}">
				</div>
			</div>
	
			####
			## search page link
			####
			<div id="searchdiv">
				<a id="searchlink" href="${executable['search']}">Search Page</a>
			</div>

			####
			## separator between search, banner and content panels
			<div id="separator0">
				<img src="${image['directory']}/${image['separator']}">
			</div>
				
			####
			## forms for autocomplete search of diseases, phenos, genes
			####
			<div id="formdiv">
				<div class="form_title" id="autocomplete_title">Autocomplete</div>
			
				<div id="formdiv0">
					<div class="form_title" id="title_form0">Diseases</div>
			
					<form action="${executable['main']}" id="form0">
						<input type="text" id="txt0">
						<input type="submit" name="${form_kw['disease']}">
						<input type="hidden" name="id" id="id0">
						<input type="hidden" name="description" id="desc0">
					</form>
				</div>
				<div id="formdiv1">
					<div class="form_title" id="title_form1">Phenotypes</div>
			
					<form action="${executable['main']}" id="form1">
						<input type="text" id="txt1">
						<input type="submit" name="${form_kw['phenotype']}">
						<input type="hidden" name="id" id="id1">
						<input type="hidden" name="description" id="desc1">
					</form>
				</div>
				<div id="formdiv2">
					<div class="form_title" id="title_form2">Genes</div>
			
					<form action="${executable['main']}" id="form2">
						<input type="text" id="txt2">
						<input type="submit" name="${form_kw['gene']}">
						<input type="hidden" name="id" id="id2">
						<input type="hidden" name="description" id="desc2">
					</form>
				</div>
			</div>
		</div>
	</body>
</html>
