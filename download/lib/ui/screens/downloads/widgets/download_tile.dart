import 'package:flutter/material.dart';

import 'download_controler.dart';

class DownloadTile extends StatelessWidget {
  const DownloadTile({super.key, required this.controller});

  final DownloadController controller;

  // TODO
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        return GestureDetector(
          onTap: controller.status == DownloadStatus.notDownloaded
              ? controller.startDownload
              : null,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.ressource.name,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    progressBar(),
                  ],
                ),
                trailingIcon(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget progressBar() {
    switch (controller.status) {
      case DownloadStatus.notDownloaded:
        return const Text("Not downloaded");

      case DownloadStatus.downloading:
        final percent = (controller.progress * 100).toStringAsFixed(1);
        final downloaded = (controller.progress * controller.ressource.size)
            .toStringAsFixed(1);

        return Text(
          "$percent % completed - $downloaded of ${controller.ressource.size} MB",
        );

      case DownloadStatus.downloaded:
        return Text("100 % completed - ${controller.ressource.size} of ${controller.ressource.size} MB");
    }
  }

  Widget trailingIcon() {
    switch (controller.status) {
      case DownloadStatus.notDownloaded:
        return const Icon(Icons.download);

      case DownloadStatus.downloading:
        return const Icon(Icons.downloading);

      case DownloadStatus.downloaded:
        return const Icon(Icons.folder);
    }
  }
}
