// backend/src/utils/logger.ts
import { createLogger, format, transports } from 'winston';

const isDev = process.env.NODE_ENV !== 'production';

const logger = createLogger({
  level: 'info',
  format: format.combine(
    format.timestamp({ format: 'YYYY-MM-DD HH:mm:ss' }),
    isDev
      ? format.combine(
          format.colorize(), // Add colors
          format.printf(
            ({ level, message, timestamp }) =>
              `${timestamp} [${level}]: ${message}`
          )
        )
      : format.printf(
          ({ level, message, timestamp }) =>
            `${timestamp} [${level}]: ${message}`
        )
  ),
  transports: [
    new transports.Console(),
    ...(isDev
      ? []
      : [
          new transports.File({ filename: 'logs/error.log', level: 'error' }),
          new transports.File({ filename: 'logs/combined.log' }),
        ]),
  ],
});

export default logger;
