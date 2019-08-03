package lala.com.a.model;

import java.io.Serializable;


public class LocationDto implements Serializable{

	
		
		private int seq;
		private String id;
		private String title;
		private String content;
		private String place;
		private int del;
		private String thumbnail;
		private String subname; // shop, attrac, food
		
		
		
		public LocationDto(int seq, String subname) {
			super();
			this.seq = seq;
			this.subname = subname;
		}

		public LocationDto() {
			
		}

		public int getSeq() {
			return seq;
		}

		public void setSeq(int seq) {
			this.seq = seq;
		}

		public String getId() {
			return id;
		}

		public void setId(String id) {
			this.id = id;
		}

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public String getContent() {
			return content;
		}

		public void setContent(String content) {
			this.content = content;
		}

		public String getPlace() {
			return place;
		}

		public void setPlace(String place) {
			this.place = place;
		}

		public int getDel() {
			return del;
		}

		public void setDel(int del) {
			this.del = del;
		}

		public String getThumbnail() {
			return thumbnail;
		}

		public void setThumbnail(String thumbnail) {
			this.thumbnail = thumbnail;
		}

		public String getSubname() {
			return subname;
		}

		public void setSubname(String subname) {
			this.subname = subname;
		}

		@Override
		public String toString() {
			return " [seq=" + seq + ", id=" + id + ", title=" + title + ", content=" + content + ", place=" + place
					+ ", del=" + del + ", thumbnail=" + thumbnail + ", subname=" + subname + "]";
		}
		


}
