
package fillingdata;

import daolayer.HibernateDAOLayer;
import entity.AerodrumMaster;
import entity.CompanyMaster;
import entity.FlightMaster;
import java.sql.Time;
import java.util.Scanner;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class FlightMasterDataFilling {

    public static void main(String[] args) {
        int flightNumber;
        String flightName;
        CompanyMaster companyId  = new CompanyMaster();
        AerodrumMaster sourceId = new AerodrumMaster();
        AerodrumMaster destinationId = new AerodrumMaster();
        Time departureTime;
        Time arrivalTime;
        Scanner in = new Scanner(System.in);
        Boolean flag = true;
        Session session = HibernateDAOLayer.getSession();
        while (flag) {
            try {
                System.out.println("Enter the Flight details :");
                System.out.print("Number :"); flightNumber = Integer.parseInt(in.nextLine());
                System.out.print("Name :"); flightName = in.nextLine();
                System.out.print("CompanyId :"); companyId.setCompanyId(Integer.parseInt(in.nextLine()));
                System.out.print("Source Id :"); sourceId.setAerodrumId(Integer.parseInt(in.nextLine()));
                System.out.print("Destination Id :"); destinationId.setAerodrumId(Integer.parseInt(in.nextLine()));
                System.out.print("Departure Time(HH:MM) :"); departureTime = getTime(in.nextLine());
                System.out.print("Arrival Time(HH:MM) :"); arrivalTime = getTime(in.nextLine());
                
                FlightMaster flight = new FlightMaster();
                flight.setFlightNumber(flightNumber);
                flight.setFlightName(flightName);
                flight.setCompanyId(companyId);
                flight.setSourceId(sourceId);
                flight.setDestinationId(destinationId);
                flight.setDepartureTime(departureTime);
                flight.setArrivalTime(arrivalTime);
                
                Transaction transaction = session.beginTransaction();
                session.save(flight);
                transaction.commit();

                System.out.print("Do you want to continue(y/n) :");
                if (in.nextLine().equalsIgnoreCase("n")) {
                    flag = false;
                }
            } catch (Exception e) {
                System.err.println("Error caught :" + e.getMessage());
            }
        }
        HibernateDAOLayer.stopConnectionProvider();
    }
    //Input format HH:MM
    public static Time getTime(String time){
        int hour = Integer.parseInt(time.substring(0, 2));
        int minutes = Integer.parseInt(time.substring(3,5));
        long millisecons = hour*60*60*1000 + minutes*60*1000;
        return new Time(millisecons);
    }
}
