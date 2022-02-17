class StorageDetail {
  final String title;
  final String svgSrc;
  final int files;
  final double memory;

  StorageDetail({
    required this.title,
    required this.svgSrc,
    required this.files,
    required this.memory,
  });
}

final storageDetails = [
  StorageDetail(
    title: 'Document Files',
    svgSrc: 'assets/icons/Documents.svg',
    files: 1328,
    memory: 15.3,
  ),
  StorageDetail(
    title: 'Media Files',
    svgSrc: 'assets/icons/media.svg',
    files: 1328,
    memory: 15.3,
  ),
  StorageDetail(
    title: 'Other Files',
    svgSrc: 'assets/icons/folder.svg',
    files: 1328,
    memory: 1.3,
  ),
  StorageDetail(
    title: 'Unknown Files',
    svgSrc: 'assets/icons/unknown.svg',
    files: 1328,
    memory: 1.3,
  ),
];
