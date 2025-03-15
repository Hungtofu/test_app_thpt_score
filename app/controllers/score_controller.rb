class ScoreController < ApplicationController
  def check
    sbd  = params[:sbd]

    unless sbd.present? && sbd.match?(/\A\d+\z/)
      return render json: {error: "SBD only numbers"}, status: :unprocessable_entity
    end
    
    student = Score.find_by(sbd: params[:sbd])

    if student
      render json: student, status: :ok 
    else
      render json: {message: "No student #{params[:sbd]}"}, status: :not_found
    end
  end

  def report
    subjects = [:toan, :ngu_van, :ngoai_ngu, :vat_li, :hoa_hoc, :sinh_hoc, :lich_su, :dia_li, :gdcd]
    stats = {}

    subjects.each do |subject|
      stats[subject] = {
        "lv1" => Score.where("#{subject} >= ?", 8).count,
        "lv2" => Score.where("#{subject} >= ? AND #{subject} < ?", 6, 8).count,
        "lv3" => Score.where("#{subject} >= ? AND #{subject} < ?", 4, 6).count,
        "lv4" => Score.where("#{subject} < ?", 4).count
      }
    end

    render json: stats, status: :ok
  end

  def top_group_a
    top = Score.select("sbd, (toan + vat_li + hoa_hoc) / 3.0 as avg_score, toan, vat_li, hoa_hoc")
    .where.not(toan: nil, vat_li: nil, hoa_hoc: nil)
    .order("avg_score DESC")
    .limit(10)

    render json: top, status: :ok
  end
end
