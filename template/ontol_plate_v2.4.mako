<html>
	<head>
		<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
		<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
		<script src="../../js/jquery.tablesorter.js"></script> 
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
		<link rel="stylesheet" type="text/css" href="${files['main']['css']}"/>
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
			## populate individual sections
			## sections are for a label, diseases, phenotypes, genes, and a network graph
			####
		
			## only include if lbl is populated assuming then all are populated
			% if lbl is not None:
				<div id="label">
					<div id="lbl_bg">
						<img src="${image['directory']}/${image['pane']['summary']}">
						<div id="title_sum">
							summary
						</div>
					</div>
					<div id="lbl">
						${lbl}
					</div>
				</div>
		
				<div class="diseases">
					<div id="dis_bg">
						<img src="${image['directory']}/${image['pane']['primary']}">
					
						<%
							numitem = len(diseases['info'])
						%>
						<div id="title_dis">
							disease:<span id="count_text"> ${numitem} results</span>
						</div>
					</div>
					<div id="dis">
						## ${dis['desc']} (${dis['id']})</br></br> ## skip use of id and desc of query id for now
						<table>
						
							<thead>
								<th>description</th>
								<th>disease accession</th>
								<th>information</th>
							</thead>
							
							<tbody>
								% for dis in diseases['info']:
									<tr>
										<td id="dis_desc">${dis['desc']}</td>
										<td id="dis_id"><a href="${executable['main']}?${keyword['disease']}=Submit&id=${dis['id']}">${dis['id']}</a></td>
									
										<td id="dis_info">
											% for information in dis['info']:  # disease ids
												${information} 
											% endfor
										</td>
									</tr>
								
								% endfor
							</tbody>
							
						</table>
					</div>
				</div>
		
				<div class="phenotypes">
					<div id="pheno_bg">
						<img src="${image['directory']}/${image['pane']['primary']}">
						
						<%
							numitem = len(phenotypes['info'])
						%>
						<div id="title_pheno">
							phenotype:<span id="count_text"> ${numitem} results</span>
						</div>
					</div>
					<div id="pheno">
						<table>
						
							<thead>
								<th>description</th>
								<th>phenotype accession</th>
								<th>information</th>
							</thead>
							
							<tbody>
								% for pheno in phenotypes['info']:
									<tr>
										<td id="pheno_desc">${pheno['desc']}</td>
										<td id="pheno_id"><a href="${executable['main']}?${keyword['phenotype']}=Submit&id=${pheno['id']}">${pheno['id']}</a></td>
								
										<td id="pheno_info">	
											% for information in pheno['info']:
												<a href="${executable['main']}?${keyword[phenotypes['type']]}=Submit&id=${information}">${information}</a> 
											% endfor
										</td>
									</tr>		
								% endfor
							</tbody>
							
						</table>
					</div>
				</div>
		
				<div class="genes">
					<div id="gene_bg">
						<img src="${image['directory']}/${image['pane']['primary']}">
							
						<%
							numitem = len(genes['info'])
						%>
						<div id="title_gene">
							gene:<span id="count_text"> ${numitem} results</span>
						</div>
					</div>
					<div id="gene">
						<table>						
							<thead>
								<th>description</th>
								<th>gene accession</th>
								<th>information</th>
							</thead>
							
							<tbody>
								% for gene in genes['info']:
									<tr>
										<td id="gene_desc">${gene['desc']}</td>
										<td id="gene_id"><a href=""${executable['main']}?${keyword['gene']}=Submit&id=${gene['id']}">${gene['id']}</a></td>
		
										<td id="gene_info">	
											% for id in gene['info']:
												 ${id}
											% endfor
										</td>
									</tr>
								% endfor
							</tbody>						
						</table>
					</div>
				</div>	
			
				<div class="network">
					<div id="tt_bg">
						<img src="${image['directory']}/${image['pane']['network']}">
					</div>
					<div id="net_bg">
						<img src="${image['directory']}/${image['pane']['csweb']}">
					</div>
					<div id="net">
						${csweb}
					</div>
				</div>
			% else:
				## show the documentation images (at this point only img) in img links
				
				<div id="mainpage">
					% for lnk in doc_img:
						<img src="${lnk}">
					% endfor
				</div>
			% endif
		
			####
			## testlbl for debugging
			####
			<div id="test">
				</br>${testlbl}</br></br>
			</div>
		
		</div>
	
		<script>
			var togglePane = true;
			$('#dis_bg').dblclick(function() {
				if(togglePane){
			  		$(this).animate({
			    		left: '+=525',
			    		top: '-=525',
			    		##height: '1857px',
			    		##width: '1300px'
			    		width: '150%'
			  		}, 500);
				}
				else{
			  		$(this).animate({
			    		left: '-=525',
			    		top: '+=525',
			    		##width: '700px',
			    		##height: '1000px'
			    		width: '200%'
			  		}, 500);
				};
				togglePane = !(togglePane);
			});
		</script>
		
		<script>
			var toggleCSWeb = true;
			$('#cytoscapeweb').dblclick(function() {
				if(toggleCSWeb){
			  		$(this).animate({
			    		left: '-=525',
			    		top: '-=525',
			    		height: '1000px',
			    		width: '1000px'
			  		}, 500);
				}
				else{
			  		$(this).animate({
			    		left: '+=525',
			    		top: '+=525',
			    		width: '350px',
			    		height: '350px'
			  		}, 500);
				};
				toggleCSWeb = !(toggleCSWeb);
			});
		</script>
		
		<script>
			$(document).ready(function(){
				$("table").tablesorter({
					sortList: [[0,0]]		
				});
			});
		</script>
		
	</body>
</html>
	