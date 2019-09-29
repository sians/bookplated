class NotesController < ApplicationController

  def new
  end

  def create
    @note = Note.new(note_params)
    authorize @note
    if @note.save
      redirect_to user_book_path(current_user, @note.users_book.book), notice: 'Note added!'
    else
      redirect_to user_book_path(current_user, @note.users_book.book), notice: 'Something went wrong!'
    end
  end

  private

  def note_params
    params.require(:note).permit(:note_text, :page_num, :users_book_id)
  end

end
