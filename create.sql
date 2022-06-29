CREATE TABLE `tracking` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `traceId` varchar(30) DEFAULT NULL,
  `messageId` varchar(50) DEFAULT NULL,
  `lineId` varchar(10) DEFAULT NULL,
  `operationId` varchar(30) DEFAULT NULL,
  `bypassMode` char(1) DEFAULT NULL COMMENT '0: 미사용, 1: 사용, 9: plc에서 세팅하지 않음, 8: reject',
  `partsType` varchar(25) DEFAULT NULL,
  `existStatus` char(1) DEFAULT NULL,
  `loadingStatus` varchar(50) DEFAULT NULL,
  `loading` char(1) DEFAULT NULL,
  `unloading` char(1) DEFAULT NULL,
  `stackPlt` char(1) DEFAULT NULL,
  `stackNgPlt` char(1) DEFAULT NULL,
  `position` tinyint DEFAULT NULL,
  `markingId` varchar(45) DEFAULT NULL,
  `triggerTime` datetime(6) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  KEY `idx_triggerTime` (`triggerTime`,`traceId`,`markingId`),
  KEY `idx_markingId` (`markingId`,`triggerTime`),
  KEY `idx_traceId` (`traceId`,`triggerTime`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tracking_ai_result` (
  `traceId` varchar(30) NOT NULL,
  `imageResult` tinyint DEFAULT NULL,
  `aeResult` tinyint DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`traceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tracking_part_type` (
  `traceId` varchar(30) NOT NULL,
  `partType` varchar(25) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`traceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
