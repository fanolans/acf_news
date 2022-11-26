import 'package:flutter/material.dart';

import '../../utils/global_functions.dart';
import '../../utils/styles.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 16),
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: kColorPrimary,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 10,
                            color: Color(0x2596C3E2),
                            offset: Offset(0, 6),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(50),
                      ),
                      alignment: const AlignmentDirectional(0, 0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        child: Text(
                          'Top Headlines',
                          style: GlobalFunctions.textTheme(context: context)
                              .subtitle1!
                              .copyWith(
                                color: Colors.black,
                              ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 16),
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: kColorPrimary,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 10,
                            color: Color(0x2596C3E2),
                            offset: Offset(0, 6),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(50),
                      ),
                      alignment: const AlignmentDirectional(0, 0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        child: Text(
                          'Health',
                          style: GlobalFunctions.textTheme(context: context)
                              .subtitle1!
                              .copyWith(
                                color: Colors.black,
                              ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 16),
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: kColorPrimary,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 10,
                            color: Color(0x2596C3E2),
                            offset: Offset(0, 6),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(50),
                      ),
                      alignment: const AlignmentDirectional(0, 0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        child: Text(
                          'Technology',
                          style: GlobalFunctions.textTheme(context: context)
                              .subtitle1!
                              .copyWith(
                                color: Colors.black,
                              ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 16),
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: kColorPrimary,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 10,
                            color: Color(0x2596C3E2),
                            offset: Offset(0, 6),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(50),
                      ),
                      alignment: const AlignmentDirectional(0, 0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        child: Text(
                          'Sports',
                          style: GlobalFunctions.textTheme(context: context)
                              .subtitle1!
                              .copyWith(
                                color: Colors.black,
                              ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
