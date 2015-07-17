class NotesController < ApplicationController
  def create
    @note = Note.new(note_params)
    @note.save
    redirect_to track_url(@note.track)
  end

  def destroy
    @note = Note.find(params[:id])
    if @note && @note.user == current_user
      track = @note.track
      @note.destroy
      redirect_to track_url(track)
    elsif @note.user != current_user
      render text: "403 FORBIDDEN"
    end
  end

  def note_params
    params.require(:note).permit(:body, :track_id)
      .merge(user_id: current_user.id)
  end
end
