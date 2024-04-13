import py4j.GatewayServer; 

class Server { 
	public String Message() { return "Python Client Working"; } 
	public static void main(String[] args) 
	{ 
		GatewayServer g = new GatewayServer(new Server()); 
		g.start(); 
		System.out.println("Gateway Server Started"); 
	} 
}
