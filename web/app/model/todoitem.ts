export enum ItemStatus {
  NOT_STARTED = "Not Started",
  IN_PROGRESS = "In Progress",
  COMPLETED = "Completed",
  ARCHIVED = "Archived",
}

export interface TodoItem {
  id: string;
  title: string;
  desc?: string;
  itemStatus: ItemStatus;
  creationDate: Date;
  lastUpdated: Date;
}

export const mockData: TodoItem[] = [
  // MARK: - Not Started
  {
    id: crypto.randomUUID(),
    title: "Buy groceries",
    desc: "Milk, Eggs, Bread, Spinach",
    itemStatus: ItemStatus.NOT_STARTED,
    creationDate: new Date(),
    lastUpdated: new Date(),
  },
  {
    id: crypto.randomUUID(),
    title: "Schedule dentist appointment",
    itemStatus: ItemStatus.NOT_STARTED,
    creationDate: new Date(),
    lastUpdated: new Date(),
  },

  // MARK: - In Progress
  {
    id: crypto.randomUUID(),
    title: "Build SwiftUI login screen",
    desc: "Implement validation and error handling",
    itemStatus: ItemStatus.IN_PROGRESS,
    creationDate: new Date(),
    lastUpdated: new Date(),
  },
  {
    id: crypto.randomUUID(),
    title: "Read 20 pages of Clean Code",
    desc: "Focus on functions chapter",
    itemStatus: ItemStatus.IN_PROGRESS,
    creationDate: new Date(),
    lastUpdated: new Date(),
  },

  // MARK: - Completed
  {
    id: crypto.randomUUID(),
    title: "Morning workout",
    desc: "30 min strength training",
    itemStatus: ItemStatus.COMPLETED,
    creationDate: new Date(),
    lastUpdated: new Date(),
  },
  {
    id: crypto.randomUUID(),
    title: "Submit project report",
    itemStatus: ItemStatus.COMPLETED,
    creationDate: new Date(),
    lastUpdated: new Date(),
  },

  // MARK: - Archived
  {
    id: crypto.randomUUID(),
    title: "2024 Tax Filing",
    desc: "All documents submitted and approved",
    itemStatus: ItemStatus.ARCHIVED,
    creationDate: new Date(),
    lastUpdated: new Date(),
  },
  {
    id: crypto.randomUUID(),
    title: "Old portfolio redesign",
    desc: "Replaced with new 2025 version",
    itemStatus: ItemStatus.ARCHIVED,
    creationDate: new Date(),
    lastUpdated: new Date(),
  },
];