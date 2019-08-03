package lala.com.a.location.attrac;

import java.util.List;

import lala.com.a.model.LocationDto;
import lala.com.a.model.PdsDto;
import lala.com.a.model.ReplyDto;



public interface AttracDao {

	// 목록
	public List<LocationDto> getAttlist(pagingBean bean);
	//글쓰기
	public boolean attwrite(LocationDto dto);
	// 파일쓰기
	public boolean uploadPds(PdsDto pds);
	// 한 글의 파일 출력
	public List<PdsDto> selectPds(PdsDto pds);
	// 글의 seq검색
	public int selectseq(LocationDto dto);
	// detail
	public LocationDto attdetail(LocationDto dto)throws Exception;
	// detail pds가져오기
	public List<PdsDto> attdetailPds(PdsDto pds)throws Exception;
	// 글 수정
	public boolean attupdate(LocationDto dto) throws Exception;
	// 파일 수정
	public boolean attFileupdate(PdsDto pds) throws Exception;
	// 수정시 파일 새로 입력
	public boolean upinsertPds(PdsDto pds);
	// 수정시에  파일 삭제
	public boolean UpdeletePds(int seq);
	// 게시글 삭제
	public boolean listdelete(int seq);
	// 게시글 삭제시 해당 댓글 삭제
	public boolean listdelete_replydelete(int pseq);
	// 게시글 삭제시 해당 pds 삭제
	public boolean listdelete_UpdeletePds(int pseq);
	// 댓글쓰기
	public boolean Replyinsert(ReplyDto rep);
	// 댓글 출력
	public List<ReplyDto> Replylist(pagingBean bean);
	// 댓글 수정하기위해 쓴 댓글 검색
	public ReplyDto Replyselect(ReplyDto rep);
	// 댓글 수정
	public boolean PReplyupdate(ReplyDto rep);
	// 댓글 삭제
	public boolean Redelete(ReplyDto rep);
	// page couunt
	public int getAttracCount(pagingBean bean);
	// 대댓글 쓰기
	public boolean SubreplyAf(ReplyDto rep);
	// 대댓글 출력
	public List<ReplyDto> Subreply(int pseq);
	// 대댓글 수정
	public boolean Subreplyup(ReplyDto rep);
	// 대댓글 삭제
	public boolean Subredelete(ReplyDto rep);
	// 한 글에 총 댓글수
	public int getAttracReplyCount(int pseq);


}
