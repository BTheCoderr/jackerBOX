export interface Equipment {
  id: string;
  name: string;
  description: string;
  category: string;
  dailyRate: number;
  images: string[];
  ownerId: string;
  location: {
    latitude: number;
    longitude: number;
    address: string;
  };
  availability: {
    startDate: Date;
    endDate: Date;
  }[];
}

export interface User {
  id: string;
  name: string;
  email: string;
  phone: string;
  isVerified: boolean;
  ratings: number;
  reviews: Review[];
}

export interface Booking {
  id: string;
  equipmentId: string;
  renterId: string;
  startDate: Date;
  endDate: Date;
  totalPrice: number;
  status: 'pending' | 'confirmed' | 'completed' | 'cancelled';
} 