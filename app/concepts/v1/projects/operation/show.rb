# frozen_string_literal: true

module V1::Projects::Operation
  class Show < Trailblazer::Operation
    step Policy::Guard(V1::Projects::Lib::Policy::AccessGuard.new), fail_fast: true
    step :find
    step :renderer_options

    def find(ctx, params:, **)
      ctx[:model] = Project.find(params[:id])
    end

    def renderer_options(ctx, **)
      ctx[:renderer_options] = {
        class: {
          Project: V1::Projects::Representer::Show
        }
      }
    end
  end
end
