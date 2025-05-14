function product_check_ok(){
				if(frm_product.title.value==""){
					alert("상품명을 써주세요.");
					frm_product.title.focus();
					return;
				}
				
				if(frm_product.price.value==""){
					alert("가격을 써주세요");
					frm_product.price.focus();
					return;
				}
				
				if(frm_product.description.value==""){
					alert("상품설명을 써주세요");
					frm_product.description.focus();
					return;
				}
				
				fn_submit();
				
		}