class NotesController < ApplicationController
  def create
    @note = Note.new(note_params)
    @note.save
    redirect_to track_url(@note.track)
  end

  def note_params
    params.require(:note).permit(:body, :track_id)
      .merge(user_id: current_user.id)
  end
end
