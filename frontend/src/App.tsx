import { FaReact, FaDatabase, FaServer, FaCode } from 'react-icons/fa';

const App = () => {
  return (
    <div className="min-h-screen bg-gradient-to-b from-gray-50 to-gray-100">
      {/* Hero Section */}
      <div className="container mx-auto px-4 py-16">
        <div className="text-center">
          <h1 className="text-5xl font-bold text-gray-800 mb-4">
            Welcome to MERN Stack
          </h1>
          <p className="text-xl text-gray-600 mb-8">
            A modern template for building full-stack applications
          </p>
          <button className="bg-blue-600 hover:bg-blue-700 text-white font-bold py-3 px-8 rounded-lg transition duration-300">
            Get Started
          </button>
        </div>
      </div>

      {/* Features Section */}
      <div className="container mx-auto px-4 py-16">
        <h2 className="text-3xl font-bold text-center text-gray-800 mb-12">
          Key Features
        </h2>
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
          <FeatureCard
            icon={<FaReact className="text-4xl text-blue-500" />}
            title="React Frontend"
            description="Modern UI with React and Tailwind CSS"
          />
          <FeatureCard
            icon={<FaServer className="text-4xl text-green-500" />}
            title="Express Backend"
            description="Robust API development with Express.js"
          />
          <FeatureCard
            icon={<FaDatabase className="text-4xl text-yellow-500" />}
            title="MongoDB Database"
            description="Flexible NoSQL database for your data"
          />
          <FeatureCard
            icon={<FaCode className="text-4xl text-purple-500" />}
            title="TypeScript"
            description="Type-safe development experience"
          />
        </div>
      </div>

      {/* Footer */}
      <footer className="bg-gray-800 text-white py-8">
        <div className="container mx-auto px-4 text-center">
          <p className="text-gray-400">Built with ❤️ using the MERN Stack</p>
          <p className="text-gray-500 text-sm mt-2">
            © {new Date().getFullYear()} Rashedul Hasan. All rights reserved.
          </p>
        </div>
      </footer>
    </div>
  );
};

// Feature Card Component
const FeatureCard = ({
  icon,
  title,
  description,
}: {
  icon: React.ReactNode;
  title: string;
  description: string;
}) => {
  return (
    <div className="bg-white p-6 rounded-xl shadow-lg hover:shadow-xl transition duration-300">
      <div className="flex flex-col items-center text-center">
        <div className="mb-4">{icon}</div>
        <h3 className="text-xl font-semibold text-gray-800 mb-2">{title}</h3>
        <p className="text-gray-600">{description}</p>
      </div>
    </div>
  );
};

export default App;
