package org.dms.web.domain;

public class VulVO {
	
	 private String detailc;
	   private String vul_field;
	   private String item_num;
	   private String vul_item;
	   private String how;
	   private String importance;
	   
	   public VulVO (String detailc, String vul_field, String item_num, String vul_item, String how, String importance) {
	      
	      this.detailc=detailc;
	      this.vul_field=vul_field;
	      this.item_num=item_num;
	      this.vul_item=vul_item;
	      this.how=how;
	      this.importance=importance;
	   }

	   public VulVO() {
	      // TODO Auto-generated constructor stub
	   }

	   public String getDetailc() {
	      return detailc;
	   }

	   public void setDetailc(String detailc) {
	      this.detailc = detailc;
	   }

	   public String getVul_field() {
	      return vul_field;
	   }

	   public void setVul_field(String vul_field) {
	      this.vul_field = vul_field;
	   }

	   public String getItem_num() {
	      return item_num;
	   }

	   public void setItem_num(String item_num) {
	      this.item_num = item_num;
	   }

	   public String getVul_item() {
	      return vul_item;
	   }

	   public void setVul_item(String vul_item) {
	      this.vul_item = vul_item;
	   }

	   public String getHow() {
	      return how;
	   }

	   public void setHow(String how) {
	      this.how = how;
	   }

	   public String getImportance() {
	      return importance;
	   }

	   public void setImportance(String importance) {
	      this.importance = importance;
	   }
}
