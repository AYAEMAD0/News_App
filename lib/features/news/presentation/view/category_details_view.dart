import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/di.dart';
import '../../../../core/widgets/error_base_widget.dart';
import '../../../../core/widgets/loading_base_widget.dart';
import '../../../home/presentation/model/category_model.dart';
import '../viewmodel/source/source_cubit.dart';
import '../viewmodel/source/source_state.dart';
import '../widget/source_tab.dart';


class CategoryDetailsView extends StatefulWidget {
  final CategoryModel category;
  const CategoryDetailsView({super.key, required this.category});

  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {
  SourceCubit viewModel = getIt<SourceCubit>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSource(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 2.w,
        vertical:10.h,
      ),
      child: BlocBuilder<SourceCubit, SourceState>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is SuccessState) {
           return SourceTab(sourceList: state.sourceList!);
          } else if (state is ErrorState) {
            return ErrorBaseWidget(
              onPressed: () {
                //todo reload
                viewModel.getSource(widget.category.id);
              },
              message: state.errorMessage.toString(),
            );
          } else {
            return LoadingBaseWidget();
          }
        },
      ),
    );
  }
}
