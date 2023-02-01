package site.filmax.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import site.filmax.admin.dto.MoviesDTO;
import site.filmax.admin.dto.PosterDTO;
import site.filmax.admin.dto.ReviewDTO;


public interface MoviesMapper {
	public int movieInsert(MoviesDTO dto);
	public int posterInsert(PosterDTO dto);
	public void moviePosterId(PosterDTO dto);
	public List<MoviesDTO> movieList();
	public List<MoviesDTO> onScreen();
	public List<MoviesDTO> movieSearch(@Param("search") String search, @Param("searchValue") String searchValue);
	public MoviesDTO movieDetail(int movie_seq);
	public String subtitle(int subtitle_id);
	public int ageLimit(int ageLimit_id);
	public String screening(int screening_id);
	public String genre(int genre_id);
	public String country(int country_id);
	public List<PosterDTO> posterMain(int movie_seq);
	public List<PosterDTO> posterSub(int movie_seq);
	public List<PosterDTO> posterStill(int movie_seq);
	public List<PosterDTO> posterList(int movie_seq);
	public List<ReviewDTO> review(int movie_seq);
	public int reviewDelete(int reviews_seq);
	public int totalReview(int movie_seq); //전체영화리뷰수!
	public List<ReviewDTO> reviewPaging(ReviewDTO dto);
	public List<ReviewDTO> reviewPaging2(ReviewDTO dto);
	public int movieDelete(int movie_seq);
	public int posterDelete(int poster_id);
	public int posterDeleteAll(int movie_seq);
	public int movieUpdate(MoviesDTO dto);
	public int posterIdUpdate(int movie_seq);
	public int posterUpdate(PosterDTO dto);
	public int postseq(String seq);
	public int posterSeqUp(String seq);
}
